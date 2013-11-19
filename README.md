#Decline to State publishing studio

This project will build a fully functional Ubuntu desktop OVA image (runnable via VirtualBox) based on the Ubuntu server image published by Canonical, with the necessary digital audio workstation software to perform audio editing of radio shows.

The Decline to State crew created this project with the intention of completely automating show production, from the editing to the publishing stages.  This process used to be tedious and non-repeatable, but with the inclusion of several powerful tools in this Ubuntu desktop image, the entire process got much, much easier and way less error prone.

At some point we plan to open up our show publishing tutorial as well.

#Software included in the built image

- Audacity
- VLC
- Sonic Visualiser
- LAME
- GStreamer
- id3tag

#Build requirements

The following software is required in the computer running the programs included in this project:

- Python
- wget
- qemu-img
- losetup
- ansible
- sudo

#Build instructions

1. Create an empty directory somewhere.
2. Run the `./build <path to the new directory>` command.

In that directory, the output OVA file will be present.

The `build` command will run sudo which may require your root password, or sudo configuration to make it passwordless.  Ensure you do what's necessary to make it work.