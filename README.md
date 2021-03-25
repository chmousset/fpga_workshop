# FPGA workshop

A simple workshop covering the basics of what is an FPGA, up to blinking some LEDs on the ULX3s


# Prerequisites

You will need jupyterlab installed to run the notebook

On Manjaro (arch): `sudo pacman -S jupyterlab jupyter-notebook`

On Ubuntu: `sudo apt install jupyter-notebook`


# Starting the notebook

simply run `jupyter notebook` and follow what's in the terminal.

Presentation mode: `./presentation/presentate.sh`

# If litex, migen etc. are in a virtualenv
Enter your virtualenv:
```
source env/bin/activate
python -m ipykernel install --user --name=fpga_env
jupyter-notebook
```

then choose `kernel->change kernel` from the notebook you opened.
