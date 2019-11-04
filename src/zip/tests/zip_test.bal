// (C) Copyright 2019 Hemika Kodikara.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import ballerina/test;
import ballerina/file;
import ballerina/filepath;

string workDir = "";

@test:BeforeSuite
public function setupEnv() {
    string tmpDir = file:tempDir();
    workDir = checkpanic filepath:build(tmpDir, "zip-test");
    if (file:exists(workDir)) {
        _ = checkpanic file:remove(workDir, true);
        _ = checkpanic file:createDir(workDir);
    }
}

@test:Config {}
public function makeZip() {
    string zipPath = checkpanic filepath:build(workDir, "zozo.zip");
    checkpanic create(zipPath, "src/zip/tests/resources/zoo", "src/zip/tests/resources/hello.txt");
    if (!file:exists(zipPath)) {
        test:assertFail();
    }
}

@test:Config {
    before: "makeZip"
}
public function unzip() {
    string zipPath = checkpanic filepath:build(workDir, "zozo.zip");
    checkpanic extract(zipPath, checkpanic filepath:build(workDir, "zozo-out"));
    if (!file:exists(checkpanic filepath:build(workDir, "zozo-out", "hello.txt"))) {
        test:assertFail("hello.txt file is missing.");
    }

    if (!file:exists(checkpanic filepath:build(workDir, "zozo-out", "zoo", "ozo.txt"))) {
        test:assertFail("ozo.txt file is missing");
    }
}

@test:AfterSuite
public function cleanup() {
    _ = checkpanic file:remove(workDir, true);
}