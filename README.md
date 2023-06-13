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