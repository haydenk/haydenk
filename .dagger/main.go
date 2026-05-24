// Pipelines for the haydenk profile README.
//
// Splices the latest-posts table into README.md from a repository_dispatch
// client_payload, or fetches the canonical table from haydenk.github.io's
// README as a fallback for manual workflow runs.
package main

import (
	"context"
	"dagger/profile/internal/dagger"
	"fmt"
	"strings"
)

const (
	startMarker = "<!-- BLOG-POST-LIST:START -->"
	endMarker   = "<!-- BLOG-POST-LIST:END -->"

	articlesStartMarker = "<!-- ARTICLES:START -->"
	articlesEndMarker   = "<!-- ARTICLES:END -->"

	blogReadmeURL = "https://raw.githubusercontent.com/haydenk/haydenk.github.io/master/README.md"
	curlImage     = "curlimages/curl:8.16.0"
)

type Profile struct{}

// UpdateReadme splices articlesMarkdown into README.md between the
// BLOG-POST-LIST markers and returns the updated README file.
func (m *Profile) UpdateReadme(
	ctx context.Context,
	// +defaultPath="/"
	// +ignore=["*", "!README.md"]
	source *dagger.Directory,
	articlesMarkdown string,
) (*dagger.File, error) {
	readme, err := source.File("README.md").Contents(ctx)
	if err != nil {
		return nil, err
	}

	si := strings.Index(readme, startMarker)
	ei := strings.Index(readme, endMarker)
	if si == -1 || ei == -1 || ei < si {
		return nil, fmt.Errorf("BLOG-POST-LIST markers not found in README.md")
	}

	table := strings.TrimRight(articlesMarkdown, "\n")
	updated := readme[:si+len(startMarker)] + "\n" + table + "\n" + readme[ei:]

	return dag.Directory().
		WithNewFile("README.md", updated).
		File("README.md"), nil
}

// FetchLatestArticles fetches haydenk.github.io's README and extracts the
// markdown table between the ARTICLES markers. Used as a manual-run fallback
// when no repository_dispatch payload is available.
func (m *Profile) FetchLatestArticles(ctx context.Context) (string, error) {
	body, err := dag.Container().
		From(curlImage).
		WithExec([]string{
			"curl", "-sSL", "--fail",
			"--max-time", "30",
			"--retry", "2",
			"--retry-connrefused",
			blogReadmeURL,
		}).
		Stdout(ctx)
	if err != nil {
		return "", err
	}

	si := strings.Index(body, articlesStartMarker)
	ei := strings.Index(body, articlesEndMarker)
	if si == -1 || ei == -1 || ei < si {
		return "", fmt.Errorf("ARTICLES markers not found in %s", blogReadmeURL)
	}

	inner := body[si+len(articlesStartMarker) : ei]
	return strings.Trim(inner, "\n"), nil
}
