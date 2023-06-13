# Personal Blog

Rendered version available at https://icex2.github.io/

## Setup notes

* Use [GitHub's pages feature](https://pages.github.com/)
* Use [jekyll](https://jekyllrb.com/) for a simple and static blogging framework 
  * Take ready to use [jekyll docker image](https://github.com/envygeeks/jekyll-docker)
    * Note that the latest does not work as well as some of the referenced ones in the readme, e.g.
      minimal, are outdated at the time of writing this
    * `4.2.0` seems to be the latest one that works
* Created [justfile](justfile) to abstract various commands for ease of use

## Development

### Local development, run server

```sh
just serve
```

### Images

* Convert images to jpg
* Reasonable size for fast loading times and less asset bloat
  * For detailed pictures, keep original size
* Remove any EXIF metadata before uploading
* 1500x seems to be a reasonable size for most images can still contain visible details but are ok
  file size wise (< 500 kb per image)

```sh
for i in *.jpg; do convert $i -strip -resize 1500x out-$i; done
```