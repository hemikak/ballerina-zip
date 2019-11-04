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
// unzip/extract `hello.zip` zip file to `moo` folder.
zip:extract("hello.zip", "moo");
```
