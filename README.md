# webpagetest-docker-setup

**Summary**
The batch files provided build and run a working private instance of WebPageTest on your docker.

**Prerequisites**
A working instance of docker on a windows machine

**Instructions**

0. You might need to adjust the line endings in the `"~\agent\script.sh` you need Linux style Line endings `LF` instead of `CRLF`. Link to tutorial: [link](https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings)
1. run *build-docker-images.bat* to build webpagetest agent and server images with disabled network shaping /known issue with default image/
2. run *start-server-and-agent.bat* to run the created images in docker
3. Access WebPageTest private instance by navigating to [http://localhost:4000/](http://localhost:4000/)
