package(default_visibility = ["//visibility:public"])

cc_library(
    name = "libzstd",
    deps = [
        ":common",
        ":compress",
        ":decompress",
        ":deprecated",
        ":zstd_header",
    ],
)

cc_library(
    name = "zdict",
    copts = [
        "-DXXH_NAMESPACE=ZSTD_",
    ],
    hdrs = [
        "lib/dictBuilder/zdict.h",
        "lib/dictBuilder/divsufsort.h",
        "lib/dictBuilder/cover.h",
    ],
    strip_include_prefix = "lib/dictBuilder",
    srcs = glob(["lib/dictBuilder/*.c"]),
    deps = [":common"],
)

cc_library(
    name = "debug",
    srcs = ["lib/common/debug.c"],
    hdrs = ["lib/common/debug.h"],
    strip_include_prefix = "lib/common",
)

cc_library(
    name = "bitstream",
    hdrs = ["lib/common/bitstream.h"],
    strip_include_prefix = "lib/common",
)

cc_library(
    name = "compiler",
    hdrs = ["lib/common/compiler.h"],
    strip_include_prefix = "lib/common",
)

cc_library(
    name = "cpu",
    hdrs = ["lib/common/cpu.h"],
)

cc_library(
    name = "errors",
    hdrs = [
        "lib/common/error_private.h",
        "lib/common/zstd_errors.h",
    ],
    srcs = ["lib/common/error_private.c"],
    strip_include_prefix = "lib/common",
)

cc_library(
    name = "mem",
    hdrs = [
        "lib/common/mem.h",
    ],
    strip_include_prefix = "lib/common",
)

cc_library(
    name = "legacy",
    hdrs = glob(["lib/legacy/*.h"]),
    srcs = glob(["lib/legacy/*.c"]),
    deps = [":common"],
    copts = [
        "-DZSTD_LEGACY_SUPPORT=4",
        "-DXXH_NAMESPACE=ZSTD_",
    ],
)

cc_library(
    copts = [
        "-DXXH_NAMESPACE=ZSTD_",
    ],
    name = "decompress",
    hdrs = glob([("lib/decompress/*_impl.h")]),
    srcs = glob(["lib/decompress/zstd*.c"]) + [
        "lib/decompress/zstd_decompress_block.h",
        "lib/decompress/zstd_decompress_internal.h",
        "lib/decompress/zstd_ddict.h",
    ],
    strip_include_prefix = "lib/decompress",
    deps = [
        ":common",
        ":legacy",
    ],
)

cc_library(
    name = "deprecated",
    hdrs = glob(["lib/deprecated/*.h"]),
    srcs = glob(["lib/deprecated/*.c"]),
    deps = [":common"],
)

cc_library(
    name = "compress",
    copts = [
        "-DXXH_NAMESPACE=ZSTD_",
    ],
    hdrs = [
        "lib/compress/zstd_compress_internal.h",
        "lib/compress/zstd_double_fast.h",
        "lib/compress/zstd_fast.h",
        "lib/compress/zstd_lazy.h",
        "lib/compress/zstd_ldm.h",
        "lib/compress/zstdmt_compress.h",
        "lib/compress/zstd_opt.h",
        "lib/compress/zstd_cwksp.h",
        "lib/compress/zstd_compress_sequences.h",
        "lib/compress/zstd_compress_literals.h",
    ],
    srcs = [
        "lib/compress/zstd_compress_sequences.c",
        "lib/compress/zstd_compress_literals.c",
        "lib/compress/zstd_compress.c",
        "lib/compress/zstd_double_fast.c",
        "lib/compress/zstd_fast.c",
        "lib/compress/zstd_lazy.c",
        "lib/compress/zstd_ldm.c",
        "lib/compress/zstdmt_compress.c",
        "lib/compress/zstd_opt.c",
        "lib/compress/hist.c",
    ],
    deps = [":common"],
)

cc_library(
    name = "hist",
    hdrs = ["lib/compress/hist.h"],
    strip_include_prefix = "lib/compress",
)

cc_library(
    name = "threading",
    hdrs = ["lib/common/threading.h"],
    srcs = ["lib/common/threading.c"],
    linkopts = ["-pthread"],
    copts = ["-DZSTD_MULTITHREAD"],
    deps = [":debug"],
)

cc_library(
    name = "pool",
    hdrs = ["lib/common/pool.h"],
    srcs = ["lib/common/pool.c"],
    deps = [
        ":debug",
        ":threading",
        ":zstd_common",
    ],
)

cc_library(
    name = "xxhash",
    hdrs = [
        "lib/common/xxhash.h",
    ],
    srcs = ["lib/common/xxhash.c"],
    copts = [
        "-DXXH_NAMESPACE=ZSTD_",
    ],
)

cc_library(
    name = "zstd_header",
    hdrs = ["lib/zstd.h"],
    strip_include_prefix = "lib",
)

cc_library(
    name = "zstd_common",
    hdrs = [
        "lib/common/zstd_internal.h",
    ],
    srcs = ["lib/common/zstd_common.c"],
    deps = [
        ":compiler",
        ":debug",
        ":entropy",
        ":errors",
        ":mem",
        ":zstd_header",
    ],
)

cc_library(
    name = "entropy",
    hdrs = [
        "lib/common/fse.h",
        "lib/common/huf.h",
    ],
    srcs = [
        "lib/common/entropy_common.c",
        "lib/common/fse_decompress.c",
        "lib/compress/fse_compress.c",
        "lib/compress/huf_compress.c",
        "lib/decompress/huf_decompress.c",
    ],
    includes = ["lib/common"],
    deps = [
        ":debug",
        ":bitstream",
        ":compiler",
        ":errors",
        ":hist",
        ":mem",
        ":threading",
        ":xxhash",
    ],
)

cc_library(
    name = "common",
    deps = [
        ":debug",
        ":bitstream",
        ":compiler",
        ":cpu",
        ":entropy",
        ":errors",
        ":mem",
        ":pool",
        ":threading",
        ":xxhash",
        ":zstd_common",
    ],
)

cc_library(
    name = "util",
    hdrs = ["programs/util.h"],
    deps = [":mem", ":platform"],
)

cc_library(
    name = "datagen",
    hdrs = ["programs/datagen.h"],
    srcs = ["programs/datagen.c"],
    deps = [":mem", ":platform"],
)

cc_library(
    name = "platform",
    hdrs = ["programs/platform.h"],
)

cc_binary(
    name = "zstd",
    srcs = ["programs/zstdcli.c"],
    deps = [":zstd_lib"],
)

cc_library(
    name = "zstd_lib",
    hdrs = glob(["programs/*.h"], exclude = ["programs/datagen.h", "programs/platform.h", "programs/util.h"]),
    srcs = glob(["programs/*.c"], exclude = ["programs/datagen.c", "programs/zstdcli.c"]),
    deps = [
        ":datagen",
        ":util",
        ":libzstd",
        ":zdict",
        ":mem",
        ":xxhash",
    ],
    copts = [
        "-DZSTD_GZCOMPRESS",
        "-DZSTD_GZDECOMPRESS",
        "-DZSTD_LZMACOMPRESS",
        "-DZSTD_LZMADECOMPRES",
        "-DZSTD_LZ4COMPRESS",
        "-DZSTD_LZ4DECOMPRES",
        "-DXXH_NAMESPACE=ZSTD_",
    ],
    linkopts = [
        "-lz",
        "-llzma",
        "-llz4",
    ],
)
