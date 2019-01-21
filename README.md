# Bazel Build for [facebook/zstd](https://github.com/facebook/zstd)

[![Build Status](https://travis-ci.org/cschuet/zstd.svg?branch=master)](https://travis-ci.org/cschuet/zstd)

Add to your WORKSPACE

```
http_archive(
    name = "com_github_cschuet_zstd",
    strip_prefix = "zstd-776a2d7385a8086324247df705c6f988f05c9c43",
    urls = [
        "https://github.com/cschuet/zstd/archive/776a2d7385a8086324247df705c6f988f05c9c43.tar.gz",
    ],
)

load("@com_github_cschuet_zstd//:bazel/repositories.bzl", "repositories")

repositories()
```

Compile with
```
bazel build @com_github_facebook_zstd//...
```

