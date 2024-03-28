- `RegisterLoad` is a register that has an write enable signal, and can also
  load data presented at `load_data`. If `load` is 1, `load_data` is saved in
  the register. If `load` is 0 and `en` is 1, `din` is saved in the register.
  Othewise, the register is not changed.

- `RegisterShiftLeft` is a shift left register. `load` and `load_data` allow
  us to set a specific value in the register. When `load` is 1, the register
  is set to `load_data`. If `load` is 0 and `en` is 1, the register shifts in
  bits the register to left by 1. The bit shifted into the register is always 0. If both `load` and `shift_en` are 0, the register is not changed.

- `RegisterShiftRight` works similarly to `RegisterShiftLeft`. The difference
  is that this type of registers shifts bits to right.

The implementation of shift registers does not depend on the number of bits in
the input and output signals. The number of bits in signals is specified when a
signal is created.

### Skeleton code and the operation of the multiplier

The skeleton code is in `mul.py`. The implementation of the multiplier is in
block `Mul_ww`. `ww` indicates the width of the adder is doubled.

The multiplier has three data ports: `x_init`, `y_init`, and `p`. The
multiplier computes `p = x_init * y_init`.

The design we have learned needs three registers to hold values for `p`, `x`,
and `y`. where `p` is the product, `x` is the multiplicand, and `y` is the
multiplier.

The multiplier also has two ports `load` and `done`, in addition to data,
clock, and reset signals.

When `load` is asserted, the multiplier loads data inputs `x_init` and `y_init`
into registers `x` and `y`, respectively, and 0 into register `p`, at the
positive edge of the clock. When we say register `p`, we mean the register that
stores `p` (or drives signal `p`). Note that `x_init` has only 8 bits while
register `x` has 16 bits. We can consider `x_init` is 0 extended inside the
register, to avoid unnecessary complexity in this lab.

When `load` is deasserted, the multiplier starts to work. When the
multiplication is completed (all bits in `y` have been checked), `done` is
asserted. After that, register `p` has the final product and is no longer
updated. Since `p` is an output signal, other modules can get the product when
`done` is asserted.

### Tasks

The signals needed in the implementation are already created in the skeleton
code.

The control module has been implemented. `done` is generated in the module.
Read the comments in the program for its interface.

The tasks to be completed in this lab are as follows.

- Instantiate registers for `p`, `x`, and `y`. Let us call the instances
  `reg_p`, `reg_x`, and `reg_y`, for `p`, `x`, and `y`, respectively.

  Most work to instantiate a module is to identify the signals that are
  connected to the instance. Study the diagram and find the corresponding
  signal in the program.

  Instantiating a module is similar to creating an object from a class in
  Python. There are examples in the skeleton code, and also in MyHDL examples
  in the repo for suplementary materials.

- Instantiate the adder.

- Generate the `test` signal in function `testgen()`.

  Check the algorithm in slides to find out which bit should be used as the
  `test` signal.

  The underlying datatype of `x`, `y`, and `p` are `intbv` (or `modbv`). We
  can access individual bits or a subset of bits. See explanations and
  examples on [this
  page](https://github.com/zhijieshi/cse3666/blob/master/myhdl/signals.md).

### Running the program

The program `mul.py` accepts a few arguments from the command line.

- `-h`: display the help message.

- `<list of numbers>`: specify a list of numbers. The multiplier will multiply
  adjacent numbers. The default is `255 255`.

  ```
  # 255 * 255
  py mul.py

  # 36 * 66
  py mul.py 36 66

  # 100 * 200, then 200 * 255
  py mul.py 100 200 255

  # more numbers can be specified
  ```

- `--trace`: generate a trace file, which can be viewed by waveform viewer like GTKWave.

Sample output of the program is in `output.txt`.

## Deliverables

Submit `mul.py` by the deadline.

## Extra

- We can save signal traces with `--trace` option and examine the signal
  waves with [GTKWave](https://github.com/gtkwave/gtkwave).

- The control module may keep the `s_en` signal to 1. If so, the bits in `x`
  and `y` are always shifted, even if the multiplication is done. Always
  shifting `reg_x` and `reg_y` does not affect the correctness of the final
  product. However, the auto grader assumes `s_en` is set to 0 when the
  multiplication is done.
