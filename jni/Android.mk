#
# Copyright (c) 2015 Cossack Labs Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto
LOCAL_SRC_FILES := crypto_dummy.c

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libsoter

LOCAL_SRC_FILES := $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../src/soter/*.c))
LOCAL_SRC_FILES += $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../src/soter/openssl/*.c))

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src $(LOCAL_PATH)
LOCAL_CFLAGS := -DOPENSSL
LOCAL_EXPORT_CFLAGS := -DOPENSSL

# LOCAL_SHARED_LIBRARIES := libcrypto
# LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libthemis

LOCAL_SRC_FILES := $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../src/themis/*.c))
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src $(LOCAL_PATH)

LOCAL_STATIC_LIBRARIES := libsoter

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libthemis_jni

LOCAL_SRC_FILES := themis_jni.c themis_message.c themis_keygen.c themis_cell.c themis_session.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src

LOCAL_STATIC_LIBRARIES := libthemis libsoter
LOCAL_SHARED_LIBRARIES := libcrypto

LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
# LOCAL_LDFLAGS := -llog

include $(BUILD_SHARED_LIBRARY)

#include $(CLEAR_VARS)

#LOCAL_MODULE := soter_test

#LOCAL_SRC_FILES := $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../tests/soter/*.c))
#LOCAL_SRC_FILES += $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../tests/common/*.c))

#LOCAL_SHARED_LIBRARIES := libthemis_jni

#LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src $(LOCAL_PATH)/../tests

#LOCAL_LDFLAGS := -Wl,--allow-shlib-undefined

#include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)

#LOCAL_MODULE := themis_test

#LOCAL_SRC_FILES := $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../tests/themis/*.c))
#LOCAL_SRC_FILES += $(patsubst jni/%,%, $(wildcard $(LOCAL_PATH)/../tests/common/*.c))

#LOCAL_SHARED_LIBRARIES := libthemis_jni

#LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src $(LOCAL_PATH)/../tests

#include $(BUILD_EXECUTABLE)

