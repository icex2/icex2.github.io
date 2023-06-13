#!/usr/bin/env just --justfile

# https://hub.docker.com/layers/jekyll/jekyll/4.2.0/images/sha256-1ead0631cb82fdbd5950a5eb5b4bfbec5e6e97bb234afc058072e3f32e537751?context=explore
docker_image := "jekyll/jekyll:4.2.0@sha256:1ead0631cb82fdbd5950a5eb5b4bfbec5e6e97bb234afc058072e3f32e537751"

# Default target, show list of available commands
help:
    #!/usr/bin/env sh
    
    echo "Recipes for working with the blog"
    
    just --list

# Build the site, output goes to _site folder
build:
    #!/usr/bin/env sh

    set -e

    docker_image={{docker_image}}
    
    docker run --rm \
        --volume="$PWD:/srv/jekyll:Z" \
        -it $docker_image \
        jekyll build

# Initialize a new site with jekyll. Keep this for reference, not requried anymore.
new:
    #!/usr/bin/env sh

    set -e

    docker_image={{docker_image}}

    docker run --rm \
        --volume="$PWD:/srv/jekyll:Z" \
        -it $docker_image \
        jekyll new .

# Build and serve the site locally on port 4000
serve:
    #!/usr/bin/env sh

    set -e

    docker_image={{docker_image}}
	
    docker run --rm \
        --volume="$PWD:/srv/jekyll:Z" \
        --publish 4000:4000 \
        $docker_image \
        jekyll serve

# Cleanup all build output
clean:
    #!/usr/bin/env sh

    set -e

    rm -r _site
    rm -r .jekyll-cache