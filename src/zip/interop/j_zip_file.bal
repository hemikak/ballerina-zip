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

import ballerinax/java;

function newZipFile(handle path) returns handle = @java:Constructor {
    class: "net.lingala.zip4j.ZipFile",
    paramTypes: ["java.lang.String"]
} external;

function addFileToZip(handle receiver, handle filePath) returns error? = @java:Method {
    name: "addFile",
    class: "net.lingala.zip4j.ZipFile",
    paramTypes: ["java.lang.String"]
} external;

function addFolderToZip(handle receiver, handle folderPath) returns error? = @java:Method {
    name: "addFolder",
    class: "net.lingala.zip4j.ZipFile",
    paramTypes: ["java.io.File"]
} external;

function extractZip(handle receiver, handle outputPath) returns error? = @java:Method {
    name: "extractAll",
    class: "net.lingala.zip4j.ZipFile",
    paramTypes: ["java.lang.String"]
} external;
