# Bazel Build for [facebook/zstd](https://github.com/facebook/zstd)

[![Build Status](https://travis-ci.org/cschuet/zstd.svg?branch=master)](https://travis-ci.org/cschuet/zstd)

Add to your WORKSPACE

```
http_archive(
    name = "com_github_cschuet_zstd",
    strip_prefix = "zstd-190d2b37467a96b5935c41edcb07097ea131c3a6",
    sha256 = "b10a78e419bfb2a20754b8f685263b98d0179ab9fd6bbfd522979405a1e80191",
    urls = [
        "https://github.com/cschuet/zstd/archive/190d2b37467a96b5935c41edcb07097ea131c3a6.tar.gz",
    ],
)

load("@com_github_cschuet_zstd//:bazel/repositories.bzl", "repositories")

repositories()
```

Compile with
```
bazel build @com_github_facebook_zstd//...
```

