# Lean with Emacs and lean-mode as a server in Docker

**NOTE!** _This is a work in progress. See below._

A [Dockerfile](Dockerfile) that builds [Lean](https://leanprover.github.io/)
from the [repository](https://github.com/leanprover/lean) and installs [GNU
Emacs](https://www.gnu.org/software/emacs/) with
[`lean-mode`](https://github.com/leanprover/lean/blob/master/src/emacs/README.md)
and runs it as a server on a minimal [Alpine
Linux](https://www.alpinelinux.org/) container.

This `Dockerfile` runs Emacs as a server using `(server-start)`.

To build and start it, run:

```
$ docker build .
$ docker run -it -p 7734:7734 --rm -v $PWD/tmp:/server <image-hash>
```

Here, we're using a local directory `$PWD/tmp` created to be the location where
Emacs will save its server file.

To connect to it as a client, run:

```
$ emacsclient -f $PWD/tmp/server -e '(* 6 7)'
```

Here, we're referencing the server file `$PWD/tmp/server` created by Emacs.
(Note that it must be an absolute path.)

Unfortunately, whenever I try something other than `-e` such as opening a file
or creating a new frame (`-c`), the server crashes:

```
Fatal error 11: Segmentation violation
```

I haven't been able to figure out why. Any help is appreciated.
