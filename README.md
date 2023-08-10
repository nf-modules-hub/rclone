# Nextflow wrapper for `rclone` process.

This little wrapper is designed to be used with orchestrator systems (HPC, K8s) which have a designated `copy` queue or node.

## Pre-requisites

- Nextflow
- Conda 

**NOTE** If you plan to setup a basic server, then you can refer [minimal-nextflow-setup](https://github.com/nf-modules-hub/minimal-nextflow-setup)


> :warning: **Conda or local setup only**:
Due to the nature of mounting files in a container, which involves a lot of copy/symlinks overheads, this wrapper assumes that you are using `rclone` installed in a location shared across all nodes.

> :heavy_check_mark: Please ensure that your `$HOME/.config/rclone/rclone.conf` file is populated with the correct details of any remotes. For more information please refer the [rclone documentation](https://rclone.org/docs/)

## Usage

```
nextflow pull https://github.com/nf-modules-hub/rclone
```

## Options

- Transfering single files/folder using `source` and `target`

To transfer a specific file/folder from any source location to a target location, you can rely upon the `source` and `target` parameters.

```
nextflow run https://github.com/nf-modules-hub/rclone --source /path/to/source --target /path/to/target
```

- Transfering bulk files/folder using `samplesheet`

To transfer a specific file/folder from any source location to a target location, you can rely upon the `samplesheet` parameter.


The structure of samplesheet is very minimal since it only requires `source` and `target` columns as shown below

```csv
source,target
/path/to/a_file,registered-remote:/destination/path/to/a_file
/path/to/a_folder,registered-remote:/destination/path/to/a_folder
```

Then refer that while invoking the pipeline

```
nextflow run https://github.com/nf-modules-hub/rclone --samplesheet /path/to/samplesheet
```


## Customizing the script

To customize these scripts, you can take a look at the available parameters in `./nextflow.config` file and then override them using a local config file, in a directory where you'd like to launch the pipeline.

## Citation

Please use the (Github `citation` page)[https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files] to cite this wrapper in your research.

## Contribution

The sole purpose of process wrappers in `nf-modules-hub` is to keep the code small, clean and hackable with some basic knowledge of `nextflow` scripting.

If you have specific requirements, you are encouraged to fork/clone and update your version to accomodate your needs. 

Contribution, in all forms, is most welcome!
