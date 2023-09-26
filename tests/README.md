<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Ghost, verified and packaged by Elestio

[Ghost](https://github.com/TryGhost/Ghost)Ghost is a powerful app for new-media creators to publish, share, and grow a business around their content.

<img src="https://github.com/elestio-examples/ghost/raw/master/screenshot.png" alt="plane" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/ghost">fully managed Ghost</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Ghost is a powerful app for new-media creators to publish, share, and grow a business around their content.

[![deploy](https://github.com/elestio-examples/ghost/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/ghost)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/ghost.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:6943`

## Docker-compose

Here are some example snippets to help you get started creating a container.

version: '3.3'
services:
  mysql:
    image: docker.io/bitnami/mysql
    restart: always
    volumes:
      - './mysql_data:/bitnami/mysql'
    environment:
      - MYSQL_USER=bn_ghost
      - MYSQL_ROOT_PASSWORD=${SOFTWARE_PASSWORD}
      - MYSQL_PASSWORD=${SOFTWARE_PASSWORD}
      - MYSQL_DATABASE=bitnami_ghost
  ghost:
    image: elestio4test/ghost:${SOFTWARE_VERSION_TAG}
    restart: always
    ports:
      - '172.17.0.1:2368:2368'
    volumes:
      - './ghost_data:/bitnami/ghost'
    depends_on:
      - mysql
    environment:
      - url=https://[DOMAIN]
      - GHOST_HOST=[DOMAIN]
      - GHOST_DATABASE_HOST=mysql
      - GHOST_DATABASE_PORT_NUMBER=3306
      - GHOST_DATABASE_USER=bn_ghost
      - GHOST_DATABASE_PASSWORD=${ADMIN_PASSWORD}
      - GHOST_DATABASE_NAME=bitnami_ghost
      - GHOST_USERNAME=${ADMIN_EMAIL}
      - GHOST_PASSWORD=${ADMIN_PASSWORD}
      - GHOST_EMAIL=${ADMIN_EMAIL}
      - GHOST_SMTP_HOST=172.17.0.1
      - GHOST_SMTP_PORT=25
      - GHOST_SMTP_FROM_ADDRESS=[DOMAIN]@vm.elestio.app


# Maintenance

## Logging

The Elestio Ghost Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/TryGhost/Ghost">Ghost Github repository</a>

- <a target="_blank" href="https://ghost.org/docs/">Ghost documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/ghost">Elestio/Ghost Github repository</a>
