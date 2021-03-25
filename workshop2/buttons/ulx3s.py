# This is our button peripheral
from migen import *
from litex.soc.interconnect.csr import *
from litex.soc.integration.doc import AutoDoc, ModuleDoc # optional

class Buttons(Module, AutoCSR, AutoDoc, ModuleDoc):
    """Simple module to read ULX3s button status"""

    # our Module inherits AutoCSR, which allows litex to automatically
    # gather this module's CSRs and map them
    # ModuleDoc allows to document our module easily
    def __init__(self, plat):
        button_names = ["UP", "DOWN", "LEFT", "RIGHT"]
        csrfields = [
            CSRField(
                name=name,
                size=1,
                description="Button {} state".format(name),
                values = [("0", "Button not pressed"), ("1", "Button pressed")]
            ) for name in button_names
        ]
        self.buttons = CSRStatus(
            fields = csrfields,
            description = "Buttons status"
        )
        # self.buttons.fields.UP.eq(plat.request("button_UP", 0))
        self.comb += [
            getattr(self.buttons.fields, name).eq(plat.request("button_"+name, 0))
            for i, name in enumerate(button_names)
        ]

# This is our SoC
from litex_boards.targets.ulx3s import BaseSoC as ulx_BaseSoC
from litex_boards.platforms.ulx3s import Platform
from litex.build.generic_platform import *

class BaseSoCf(ulx_BaseSoC):
    def __init__(self, **kwargs):
        #self.platform = Platform(device=device, revision=revision, toolchain=toolchain)
        super().__init__(**kwargs)

        # add out missing button IOs
        self.platform.add_extension([
            ("button_UP", 0, Pins("R18"), IOStandard("LVCMOS33")),
            ("button_DOWN", 0, Pins("V1"), IOStandard("LVCMOS33")),
            ("button_LEFT", 0, Pins("U1"), IOStandard("LVCMOS33")),
            ("button_RIGHT", 0, Pins("H16"), IOStandard("LVCMOS33")),
        ])
        
        # instanciate our `Button` module.
        # don't forget to add it to `self.submodules` !
        self.submodules.buttons = Buttons(self.platform)
        self.add_csr("buttons")


import litex_boards
litex_boards.targets.ulx3s.BaseSoC = BaseSoCf
from litex_boards.targets.ulx3s import main as ulx_main
if __name__ == '__main__':
    ulx_main()
