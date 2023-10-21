# DB Adminer Package

This is a [Kurtosis package](https://docs.kurtosis.com/concepts-reference/packages) for starting an [Adminer](https://www.adminer.org/) instance.

Run this package
----------------
If [you have Kurtosis installed][install-kurtosis], you can run: 

```bash
kurtosis run github.com/bharath-123/db-adminer-package
```

If you don't have Kurtosis installed, [click here to run this package on the Kurtosis playground](https://gitpod.io/#KURTOSIS_PACKAGE_LOCATOR=github.com%2Fbharath-123%db-adminer-package/https://github.com/kurtosis-tech/playground-gitpod).

The information for accessing the Postgres port will be outputted as a result of the run:

```
========================================== User Services ==========================================
UUID           Name      Ports                                         Status
423898953f74   adminer   adminer: 8080/tcp -> http://127.0.0.1:65426   RUNNING
```

To blow away the created [enclave][enclaves-reference], run `kurtosis clean -a`.

#### Return value

See the "Using this package in your package" section below.

</details>

Use this package in your package
--------------------------------
Kurtosis packages can be composed inside other Kurtosis packages. To use this package in your package...

First, import this package by adding the following to the top of your Starlark file:

```python
adminer = import_module("github.com/bharath-123/db-adminer-package/main.star")
```

Then, call the this package's `run` function somewhere in your Starlark script:

```python
adminer_output = adminer.run(plan)
```

The `run` function of this package will return a struct with the following properties:

```python
adminer_output = adminer.run(plan)

# An Service object instance (see https://docs.kurtosis.com/starlark-reference/service)
# Used to get information about the Adminer instance
adminer_output.service

# A PortSpec object containing information about the port Adminer is listening on (see https://docs.kurtosis.com/starlark-reference/port-spec)
adminer_output.port
```

Develop on this package
-----------------------
1. [Install Kurtosis][install-kurtosis]
1. Clone this repo
1. For your dev loop, run `kurtosis clean -a && kurtosis run .` inside the repo directory


<!-------------------------------- LINKS ------------------------------->
[install-kurtosis]: https://docs.kurtosis.com/install
[enclaves-reference]: https://docs.kurtosis.com/concepts-reference/enclaves
[service-reference]: https://docs.kurtosis.com/starlark-reference/plan
