# phpspy-docker

## Usage
* Build the image `docker build -t phpspy .`
* Run it in the container you want to spy processes on. `docker run -it --rm --pid="container:php-container-name" --privileged phpspy`
* The above will open up a bash console, with phpspy on it, which would be on the same process namespace as the PHP container, and have privileges to inspect processes (something that cannot happen without `--privileged`)
* Run `phpspy -p 172 -t` on that terminal with the appropiate Process ID you want to inspect.
