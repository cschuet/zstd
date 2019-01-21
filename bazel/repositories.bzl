load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def repositories():
    _maybe(
        http_archive,
        name = "com_github_facebook_zstd",
	build_file = "@com_github_cschuet_zstd//bazel/third_party:zstd.BUILD",
        strip_prefix = "zstd-bd2740f3476c46b9f69d59e49e7391c2762e04b3",
	sha256 = "188ba167e7a507b545c5f455af4afe3a34b2cee5551949fa000a8218ff4fda67",
        urls = [
            "https://github.com/facebook/zstd/archive/bd2740f3476c46b9f69d59e49e7391c2762e04b3.tar.gz",
        ],
    )
