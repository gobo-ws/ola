# LIBRARIES
##################################################
if USE_HUE
# This is a library which isn't coupled to olad
noinst_LTLIBRARIES += plugins/hue/libolananoleafnode.la
plugins_nanoleaf_libolananoleafnode_la_SOURCES = plugins/hue/NanoleafNode.cpp \
                                                 plugins/hue/NanoleafNode.h
plugins_nanoleaf_libolananoleafnode_la_LIBADD = common/libolacommon.la

lib_LTLIBRARIES += plugins/hue/libolananoleaf.la

# Plugin description is generated from README.md
built_sources += plugins/hue/NanoleafPluginDescription.h
nodist_plugins_nanoleaf_libolananoleaf_la_SOURCES = \
    plugins/hue/NanoleafPluginDescription.h
plugins/hue/NanoleafPluginDescription.h: plugins/hue/README.md plugins/hue/Makefile.mk plugins/convert_README_to_header.sh
	sh $(top_srcdir)/plugins/convert_README_to_header.sh $(top_srcdir)/plugins/nanoleaf $(top_builddir)/plugins/hue/NanoleafPluginDescription.h

plugins_nanoleaf_libolananoleaf_la_SOURCES = \
    plugins/hue/NanoleafPlugin.cpp \
    plugins/hue/NanoleafPlugin.h \
    plugins/hue/NanoleafDevice.cpp \
    plugins/hue/NanoleafDevice.h \
    plugins/hue/NanoleafPort.h
plugins_nanoleaf_libolananoleaf_la_LIBADD = \
    olad/plugin_api/libolaserverplugininterface.la \
    plugins/hue/libolananoleafnode.la

# TESTS
##################################################
test_programs += plugins/hue/NanoleafTester

plugins_nanoleaf_NanoleafTester_SOURCES = plugins/hue/NanoleafNodeTest.cpp
plugins_nanoleaf_NanoleafTester_CXXFLAGS = $(COMMON_TESTING_FLAGS)
plugins_nanoleaf_NanoleafTester_LDADD = $(COMMON_TESTING_LIBS) \
                                        plugins/hue/libolananoleafnode.la
endif

EXTRA_DIST += plugins/hue/README.md
