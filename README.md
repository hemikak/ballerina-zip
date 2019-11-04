[![Build Status](https://travis-ci.com/hemikak/ballerina-zip.svg?branch=master)](https://travis-ci.com/hemikak/ballerina-zip)

# hemikak/zip
Zip library to create or extract zip files.

## Module Overview
A ballerina library that allows you to create and extract zip files. This wraps the [zip4j](https://github.com/srikanth-lingala/zip4j) library. Credits to them.

## Samples
### Create Zip File.
```ballerina
// creating a zip file and include `foo` folder and `bar.txt` file.
zip:create("hello.zip", "foo", "bar.txt");
```

### Unzip a Zip file.
```ballerina
// creating a zip file and include `foo` folder and `bar.txt` file.
zip:extract("hello.zip, "moo");
```
