PORT_NAME = "adminer"
ADMINER_PORT_NUMBER = 8080

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
        )
    )

    return struct(
        serivce = adminer_service,
        port = adminer_service.ports[PORT_NAME],
    )