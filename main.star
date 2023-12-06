PORT_NAME = "adminer"
ADMINER_PORT_NUMBER = 8080

ADMINER_MIN_CPU = 10
ADMINER_MAX_CPU = 1000
ADMINER_MIN_MEMORY = 32
ADMINER_MAX_MEMORY = 1024
def run(plan, default_db, default_driver, default_password, 
        default_server, default_username, image = "michalhosna/adminer", service_name = "adminer", 
):
    """
    Launches an adminer setup which can be used to inspect postgres, mysql databases etc
    """
    adminer_service = plan.add_service(
        name = service_name,
        config = ServiceConfig(
            image = image,
            ports = {
                PORT_NAME: PortSpec(
                    number = ADMINER_PORT_NUMBER,
                    transport_protocol="TCP",
                    application_protocol="http",
                )
            },
            env_vars = {
                "ADMINER_PLUGINS": "tables-filter tinymce",
                "ADMINER_DB": default_db,
                "ADMINER_DRIVER": default_driver,
                "ADMINER_PASSWORD": default_password,
                "ADMINER_SERVER": default_server,
                "ADMINER_USERNAME": default_username,
                "ADMINER_AUTOLOGIN": "1",
            },
            min_cpu:ADMINER_MIN_CPU,
            max_CPU:ADMINER_MAX_CPU,
            min_memory:ADMINER_MIN_MEMORY,
            max_memory:ADMINER_MAX_MEMORY,
        )
    )

    return struct(
        serivce = adminer_service,
        port = adminer_service.ports[PORT_NAME],
        min_cpu=min_cpu,
        max_cpu=max_cpu,
        min_memory=min_memory,
        max_memory=max_memory,
    )
