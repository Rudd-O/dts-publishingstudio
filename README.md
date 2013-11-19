#Decline to State publishing studio

This project will build a fully functional Ubuntu desktop OVA image (runnable via VirtualBox) based on the Ubuntu server image published by Canonical, with the necessary digital audio workstation software to perform audio editing of radio shows.

The Decline to State crew created this project with the intention of completely automating show production, from the editing to the publishing stages.  This process used to be tedious and non-repeatable, but with the inclusion of several powerful tools in this Ubuntu desktop image, the entire process got much, much easier and way less error prone.

At some point we plan to open up our show publishing tutorial as well.

##Software included in the built image

- Audacity
- VLC
- Sonic Visualiser
- LAME
- GStreamer
- id3tag

##Description of the contents

This project mainly contains two files:

1. `build`.  This is the program that will download the original Ubuntu images, and set up the necessary low-level stuff to make the image programmable.  After these steps are done, ansible is invoked to run `setup.yml` on the image.  Once ansible is done, this program zips up the resulting files and creates the OVA file that can be run in VirtualBox.
2. `setup.yml`.  This file describes to ansible all the operations that must be performed on the image to ready it up for usage.  Ansible follows the instructions in this file to prep the image for creation.

##Build requirements

The following software is required in the computer running the programs included in this project:

- Python
- wget
- qemu-img
- losetup
- ansible
- sudo

##Build instructions

1. Change into the directory where you cloned this repository.
2. Create an empty directory somewhere.
3. Run the `./build <path to the new directory>` command.

In that directory, the output OVA file will be present when the process is done.

The `build` command will run sudo which may require your root password, or sudo configuration to make it passwordless.  Ensure you do what's necessary to make it work.
