load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def repositories():
    _maybe(
        http_archive,
        name = "com_github_facebook_zstd",
	build_file = "@com_github_cschuet_zstd//bazel/third_party:zstd.BUILD",
        strip_prefix = "zstd-1.4.4",
	sha256 = "a364f5162c7d1a455cc915e8e3cf5f4bd8b75d09bc0f53965b0c9ca1383c52c8",
        urls = [
            "https://github.com/facebook/zstd/archive/v1.4.4.tar.gz",
        ],
    )
