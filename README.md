#Decline to State publishing studio

This project creates an Ubuntu appliance ready to perform audio editing of radio shows, with all the necessary digital audio workstation software.

You can use and distribute the appliances created by this project.

The Decline to State crew created this project with the intention of completely automating show production, from the editing to the publishing stages.  This process used to be tedious and non-repeatable, but with the inclusion of several powerful tools in this Ubuntu desktop image, the entire process got much, much easier and way less error prone.

At some point we plan to open up our show publishing tutorial as well.

This project is a companion to the
[Decline to State recording studio](https://github.com/Rudd-O/dts-recordingstudio),
which you can use to record shows, that you can later edit with this project to
publish them online.

#Building an appliance

The appliance this process outputs is an Ubuntu desktop appliance as an OVA image (runnable via VirtualBox 4.3.4) based on the Ubuntu cloud server 13.10 image published by Canonical.

##Build requirements

The following software is required to run the appliance build process:

- Python
- wget
- qemu-img
- qemu-system-x86_64
- losetup
- ansible
- zerofree
- VirtualBox

So first install these programs (all available in your distribution's repositories).

##Running the build process

To create the appliance:

1. Change into the directory where you cloned this repository.
2. Create an empty directory somewhere.  This will be the scratch space and the output directory for the OVA.
3. As root, run the `./build <path to the new directory>` command.  If you want to preserve the temporary files, prepend `NOCLEANUP=1 ` to the `build` command.

The `build` command needs to be run with root privileges, or some sudo configuration to make it passwordless.  Ensure you do what's necessary to make it work.

The OVA file will be present In the output directory you specified for the `build` command, when the process is done.  It will be named `dts-publishingstudio-<XX>.<YY>-amd64.ova`.
You can import this OVA file into VirtualBox through the Import Appliance... menu item in VirtualBox.

#Using the appliance

First, import the OVA file with your VirtualBox GUI.  Then run it from there.

The appliance should log you in automatically.  Once you are logged in, you can use Audacity to perform audio editing.

The initial `ubuntu` user password is `password` -- change it if you want.

##Software included in the built image

- JACK and QJackCtl
  - JACK autostarts on login
  - PulseAudio automatically maps outputs to JACK
- Audacity
  - Configured by default to use JACK
- VLC
  - Plays through JACK via PulseAudio
- Sonic Visualiser
  - Plays through JACK via PulseAudio
- LAME
- GStreamer
- id3tag

##Upgrading your appliance

There's a built-in mechanism in the appliance to update its programs and configuration to the latest version without the need to spin an entirely new appliance.

This mechanism can be invoked by calling `updatestudio`.  It will download the latest version of this repository, and then re-run the portion of the setup that runs inside the appliance.

#Developer information

##Understanding this project

This project contains several files:

1. `build`.  This is the program that will download the original Ubuntu images, and set up the necessary low-level stuff to make the image programmable.  After these steps are done, ansible is invoked to run `setup.yml` on the image.  Once ansible is done, this program installs the bootloader on the image by running QEMU.  Then it frees empty space on the images and zips up the resulting files, creating the OVA file that can be run in VirtualBox.
2. `setup.yml`.  This file describes to ansible all the operations that must be performed on the image to ready it up for usage.  Ansible follows the instructions in this file to prep the image for creation.
