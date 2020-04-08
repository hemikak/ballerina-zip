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

import ballerina/file;
import ballerina/filepath;
import ballerina/java;

# Extract a zip file to a specific location.
# 
# + zipPath - Path of the zip file.
# + outputPath - Output directory.
# + return - Error if occurred.
public function extract(string zipPath, string outputPath) returns error? {
    if (!file:exists(zipPath)) {
        _ = check file:createDir(zipPath, true);
    }
    handle zipfile = newZipFile(java:fromString(zipPath));
    check extractZip(zipfile, java:fromString(outputPath));
}

# Create a zip file with files.
# 
# + outputPath - The location of the zip file.
# + files - The list of files/directories.
# + return - Error if occurred.
public function create(string outputPath, file:FileInfo|string... files) returns error? {
    if (!file:exists(check filepath:parent(outputPath))) {
        _ = check file:createDir(check filepath:parent(outputPath), true);
    }
    // _ = check file:createFile(outputPath);
    handle zipfile = newZipFile(java:fromString(outputPath));
    foreach file:FileInfo|string filepath in files {
        if (filepath is string) {
            file:FileInfo fileInfo = check file:getFileInfo(filepath);
            if (fileInfo.isDir()) {
                handle file = newFile(java:fromString(filepath));
                check addFolderToZip(zipfile, file);
            } else {
                check addFileToZip(zipfile, java:fromString(filepath));
            }
        } else {
            if (filepath.isDir()) {
                handle file = newFile(java:fromString(filepath.getName()));
                check addFolderToZip(zipfile, file);
            } else {
                check addFileToZip(zipfile, java:fromString(filepath.getName()));
            }
        }
    }
}