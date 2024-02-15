-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Windows\Documents\Practicas MATLAB\Cuadratico\cuadratico\Discrete_FIR_Filter.vhd
-- Created: 2022-05-28 20:58:20
-- 
-- Generated by MATLAB 9.2 and HDL Coder 3.10
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Discrete_FIR_Filter
-- Source Path: cuadratico/cuadratico/Discrete FIR Filter
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.cuadratico_pkg.ALL;

ENTITY Discrete_FIR_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        Discrete_FIR_Filter_in            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Discrete_FIR_Filter_out           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
        );
END Discrete_FIR_Filter;


ARCHITECTURE rtl OF Discrete_FIR_Filter IS

  -- Signals
  SIGNAL Discrete_FIR_Filter_in_signed    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL coeff1                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL delay_pipeline_1                 : vector_of_signed32(0 TO 33);  -- sfix32_En28 [34]
  SIGNAL delay_pipeline_0                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_1_1               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_2                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_3                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_4                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_5                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_6                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_7                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_8                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_9                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_10                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_11                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_13                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_14                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_16                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_17                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_18                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_19                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_20                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_21                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_22                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_23                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_24                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_25                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_26                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_27                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_29                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_30                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_31                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_32                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delay_pipeline_33                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL multiplier_mul_temp              : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product1                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff2                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_1            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product2                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast                   : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_1                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum1_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum1                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff3                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_2            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product3                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_2                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_3                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum2_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum2                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff4                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_3            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product4                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_4                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_5                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum3_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum3                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff5                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_4            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product5                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_6                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_7                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum4_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum4                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff6                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_5            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product6                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_8                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_9                 : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum5_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum5                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff7                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_6            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product7                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_10                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_11                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum6_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum6                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff8                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_7            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product8                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_12                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_13                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum7_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum7                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff9                           : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_8            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product9                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_14                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_15                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum8_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum8                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff10                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_9            : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product10                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_16                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_17                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum9_temp                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum9                             : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff11                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_10           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product11                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_18                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_19                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum10_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum10                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff12                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_11           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product12                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_20                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_21                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum11_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum11                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff13                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_12           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product13                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_22                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_23                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum12_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum12                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL delay_pipeline_12                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL gain_mul_temp                    : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product14                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_24                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_25                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum13_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum13                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff15                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_13           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product15                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_26                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_27                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum14_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum14                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff16                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_14           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product16                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_28                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_29                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum15_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum15                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL delay_pipeline_15                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL gain_mul_temp_1                  : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product17                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_30                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_31                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum16_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum16                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff18                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_15           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product18                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_32                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_33                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum17_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum17                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff19                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_16           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product19                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_34                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_35                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum18_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum18                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff20                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_17           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product20                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_36                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_37                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum19_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum19                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff21                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_18           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product21                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_38                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_39                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum20_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum20                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff22                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_19           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product22                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_40                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_41                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum21_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum21                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff23                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_20           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product23                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_42                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_43                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum22_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum22                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff24                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_21           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product24                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_44                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_45                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum23_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum23                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff25                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_22           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product25                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_46                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_47                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum24_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum24                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff26                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_23           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product26                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_48                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_49                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum25_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum25                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff27                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_24           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product27                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_50                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_51                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum26_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum26                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff28                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_25           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product28                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_52                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_53                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum27_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum27                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff29                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_26           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product29                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_54                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_55                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum28_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum28                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL delay_pipeline_28                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL gain_mul_temp_2                  : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product30                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_56                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_57                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum29_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum29                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff31                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_27           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product31                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_58                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_59                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum30_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum30                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff32                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_28           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product32                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_60                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_61                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum31_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum31                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff33                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_29           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product33                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_62                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_63                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum32_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum32                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff34                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_30           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product34                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_64                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_65                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum33_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum33                            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL coeff35                          : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL multiplier_mul_temp_31           : signed(47 DOWNTO 0);  -- sfix48_En38
  SIGNAL product35                        : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL adder_add_cast_66                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL adder_add_cast_67                : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum34_temp                       : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL sum34                            : signed(15 DOWNTO 0);  -- sfix16_En10

BEGIN
  Discrete_FIR_Filter_in_signed <= signed(Discrete_FIR_Filter_in);

  coeff1 <= to_signed(16#00EB#, 16);

  Delay_Pipeline_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        delay_pipeline_1 <= (OTHERS => to_signed(0, 32));
      ELSE 
        delay_pipeline_1(0) <= Discrete_FIR_Filter_in_signed;
        delay_pipeline_1(1 TO 33) <= delay_pipeline_1(0 TO 32);
      END IF;
    END IF;
  END PROCESS Delay_Pipeline_process;


  delay_pipeline_0 <= delay_pipeline_1(0);

  delay_pipeline_1_1 <= delay_pipeline_1(1);

  delay_pipeline_2 <= delay_pipeline_1(2);

  delay_pipeline_3 <= delay_pipeline_1(3);

  delay_pipeline_4 <= delay_pipeline_1(4);

  delay_pipeline_5 <= delay_pipeline_1(5);

  delay_pipeline_6 <= delay_pipeline_1(6);

  delay_pipeline_7 <= delay_pipeline_1(7);

  delay_pipeline_8 <= delay_pipeline_1(8);

  delay_pipeline_9 <= delay_pipeline_1(9);

  delay_pipeline_10 <= delay_pipeline_1(10);

  delay_pipeline_11 <= delay_pipeline_1(11);

  delay_pipeline_13 <= delay_pipeline_1(13);

  delay_pipeline_14 <= delay_pipeline_1(14);

  delay_pipeline_16 <= delay_pipeline_1(16);

  delay_pipeline_17 <= delay_pipeline_1(17);

  delay_pipeline_18 <= delay_pipeline_1(18);

  delay_pipeline_19 <= delay_pipeline_1(19);

  delay_pipeline_20 <= delay_pipeline_1(20);

  delay_pipeline_21 <= delay_pipeline_1(21);

  delay_pipeline_22 <= delay_pipeline_1(22);

  delay_pipeline_23 <= delay_pipeline_1(23);

  delay_pipeline_24 <= delay_pipeline_1(24);

  delay_pipeline_25 <= delay_pipeline_1(25);

  delay_pipeline_26 <= delay_pipeline_1(26);

  delay_pipeline_27 <= delay_pipeline_1(27);

  delay_pipeline_29 <= delay_pipeline_1(29);

  delay_pipeline_30 <= delay_pipeline_1(30);

  delay_pipeline_31 <= delay_pipeline_1(31);

  delay_pipeline_32 <= delay_pipeline_1(32);

  delay_pipeline_33 <= delay_pipeline_1(33);

  multiplier_mul_temp <= Discrete_FIR_Filter_in_signed * coeff1;
  product1 <= multiplier_mul_temp(43 DOWNTO 28);

  coeff2 <= to_signed(16#00D7#, 16);

  multiplier_mul_temp_1 <= delay_pipeline_0 * coeff2;
  product2 <= multiplier_mul_temp_1(43 DOWNTO 28);

  adder_add_cast <= resize(product1, 17);
  adder_add_cast_1 <= resize(product2, 17);
  sum1_temp <= adder_add_cast + adder_add_cast_1;

  sum1 <= sum1_temp(15 DOWNTO 0);

  coeff3 <= to_signed(16#00B7#, 16);

  multiplier_mul_temp_2 <= delay_pipeline_1_1 * coeff3;
  product3 <= multiplier_mul_temp_2(43 DOWNTO 28);

  adder_add_cast_2 <= resize(sum1, 17);
  adder_add_cast_3 <= resize(product3, 17);
  sum2_temp <= adder_add_cast_2 + adder_add_cast_3;

  sum2 <= sum2_temp(15 DOWNTO 0);

  coeff4 <= to_signed(16#009F#, 16);

  multiplier_mul_temp_3 <= delay_pipeline_2 * coeff4;
  product4 <= multiplier_mul_temp_3(43 DOWNTO 28);

  adder_add_cast_4 <= resize(sum2, 17);
  adder_add_cast_5 <= resize(product4, 17);
  sum3_temp <= adder_add_cast_4 + adder_add_cast_5;

  sum3 <= sum3_temp(15 DOWNTO 0);

  coeff5 <= to_signed(16#008B#, 16);

  multiplier_mul_temp_4 <= delay_pipeline_3 * coeff5;
  product5 <= multiplier_mul_temp_4(43 DOWNTO 28);

  adder_add_cast_6 <= resize(sum3, 17);
  adder_add_cast_7 <= resize(product5, 17);
  sum4_temp <= adder_add_cast_6 + adder_add_cast_7;

  sum4 <= sum4_temp(15 DOWNTO 0);

  coeff6 <= to_signed(16#0073#, 16);

  multiplier_mul_temp_5 <= delay_pipeline_4 * coeff6;
  product6 <= multiplier_mul_temp_5(43 DOWNTO 28);

  adder_add_cast_8 <= resize(sum4, 17);
  adder_add_cast_9 <= resize(product6, 17);
  sum5_temp <= adder_add_cast_8 + adder_add_cast_9;

  sum5 <= sum5_temp(15 DOWNTO 0);

  coeff7 <= to_signed(16#005F#, 16);

  multiplier_mul_temp_6 <= delay_pipeline_5 * coeff7;
  product7 <= multiplier_mul_temp_6(43 DOWNTO 28);

  adder_add_cast_10 <= resize(sum5, 17);
  adder_add_cast_11 <= resize(product7, 17);
  sum6_temp <= adder_add_cast_10 + adder_add_cast_11;

  sum6 <= sum6_temp(15 DOWNTO 0);

  coeff8 <= to_signed(16#004D#, 16);

  multiplier_mul_temp_7 <= delay_pipeline_6 * coeff8;
  product8 <= multiplier_mul_temp_7(43 DOWNTO 28);

  adder_add_cast_12 <= resize(sum6, 17);
  adder_add_cast_13 <= resize(product8, 17);
  sum7_temp <= adder_add_cast_12 + adder_add_cast_13;

  sum7 <= sum7_temp(15 DOWNTO 0);

  coeff9 <= to_signed(16#003B#, 16);

  multiplier_mul_temp_8 <= delay_pipeline_7 * coeff9;
  product9 <= multiplier_mul_temp_8(43 DOWNTO 28);

  adder_add_cast_14 <= resize(sum7, 17);
  adder_add_cast_15 <= resize(product9, 17);
  sum8_temp <= adder_add_cast_14 + adder_add_cast_15;

  sum8 <= sum8_temp(15 DOWNTO 0);

  coeff10 <= to_signed(16#002B#, 16);

  multiplier_mul_temp_9 <= delay_pipeline_8 * coeff10;
  product10 <= multiplier_mul_temp_9(43 DOWNTO 28);

  adder_add_cast_16 <= resize(sum8, 17);
  adder_add_cast_17 <= resize(product10, 17);
  sum9_temp <= adder_add_cast_16 + adder_add_cast_17;

  sum9 <= sum9_temp(15 DOWNTO 0);

  coeff11 <= to_signed(16#001C#, 16);

  multiplier_mul_temp_10 <= delay_pipeline_9 * coeff11;
  product11 <= multiplier_mul_temp_10(43 DOWNTO 28);

  adder_add_cast_18 <= resize(sum9, 17);
  adder_add_cast_19 <= resize(product11, 17);
  sum10_temp <= adder_add_cast_18 + adder_add_cast_19;

  sum10 <= sum10_temp(15 DOWNTO 0);

  coeff12 <= to_signed(16#000F#, 16);

  multiplier_mul_temp_11 <= delay_pipeline_10 * coeff12;
  product12 <= multiplier_mul_temp_11(43 DOWNTO 28);

  adder_add_cast_20 <= resize(sum10, 17);
  adder_add_cast_21 <= resize(product12, 17);
  sum11_temp <= adder_add_cast_20 + adder_add_cast_21;

  sum11 <= sum11_temp(15 DOWNTO 0);

  coeff13 <= to_signed(16#0003#, 16);

  multiplier_mul_temp_12 <= delay_pipeline_11 * coeff13;
  product13 <= multiplier_mul_temp_12(43 DOWNTO 28);

  adder_add_cast_22 <= resize(sum11, 17);
  adder_add_cast_23 <= resize(product13, 17);
  sum12_temp <= adder_add_cast_22 + adder_add_cast_23;

  sum12 <= sum12_temp(15 DOWNTO 0);

  delay_pipeline_12 <= delay_pipeline_1(12);

  -- coeff14
  -- CSD Encoding (8) : 1000; Cost (Adders) = 0
  gain_mul_temp <=  - (resize(delay_pipeline_12 & '0' & '0' & '0', 48));
  product14 <= gain_mul_temp(43 DOWNTO 28);

  adder_add_cast_24 <= resize(sum12, 17);
  adder_add_cast_25 <= resize(product14, 17);
  sum13_temp <= adder_add_cast_24 + adder_add_cast_25;

  sum13 <= sum13_temp(15 DOWNTO 0);

  coeff15 <= to_signed(-16#0011#, 16);

  multiplier_mul_temp_13 <= delay_pipeline_13 * coeff15;
  product15 <= multiplier_mul_temp_13(43 DOWNTO 28);

  adder_add_cast_26 <= resize(sum13, 17);
  adder_add_cast_27 <= resize(product15, 17);
  sum14_temp <= adder_add_cast_26 + adder_add_cast_27;

  sum14 <= sum14_temp(15 DOWNTO 0);

  coeff16 <= to_signed(-16#0019#, 16);

  multiplier_mul_temp_14 <= delay_pipeline_14 * coeff16;
  product16 <= multiplier_mul_temp_14(43 DOWNTO 28);

  adder_add_cast_28 <= resize(sum14, 17);
  adder_add_cast_29 <= resize(product16, 17);
  sum15_temp <= adder_add_cast_28 + adder_add_cast_29;

  sum15 <= sum15_temp(15 DOWNTO 0);

  delay_pipeline_15 <= delay_pipeline_1(15);

  -- coeff17
  -- CSD Encoding (32) : 100000; Cost (Adders) = 0
  gain_mul_temp_1 <=  - (resize(delay_pipeline_15 & '0' & '0' & '0' & '0' & '0', 48));
  product17 <= gain_mul_temp_1(43 DOWNTO 28);

  adder_add_cast_30 <= resize(sum15, 17);
  adder_add_cast_31 <= resize(product17, 17);
  sum16_temp <= adder_add_cast_30 + adder_add_cast_31;

  sum16 <= sum16_temp(15 DOWNTO 0);

  coeff18 <= to_signed(-16#0026#, 16);

  multiplier_mul_temp_15 <= delay_pipeline_16 * coeff18;
  product18 <= multiplier_mul_temp_15(43 DOWNTO 28);

  adder_add_cast_32 <= resize(sum16, 17);
  adder_add_cast_33 <= resize(product18, 17);
  sum17_temp <= adder_add_cast_32 + adder_add_cast_33;

  sum17 <= sum17_temp(15 DOWNTO 0);

  coeff19 <= to_signed(-16#002A#, 16);

  multiplier_mul_temp_16 <= delay_pipeline_17 * coeff19;
  product19 <= multiplier_mul_temp_16(43 DOWNTO 28);

  adder_add_cast_34 <= resize(sum17, 17);
  adder_add_cast_35 <= resize(product19, 17);
  sum18_temp <= adder_add_cast_34 + adder_add_cast_35;

  sum18 <= sum18_temp(15 DOWNTO 0);

  coeff20 <= to_signed(-16#002D#, 16);

  multiplier_mul_temp_17 <= delay_pipeline_18 * coeff20;
  product20 <= multiplier_mul_temp_17(43 DOWNTO 28);

  adder_add_cast_36 <= resize(sum18, 17);
  adder_add_cast_37 <= resize(product20, 17);
  sum19_temp <= adder_add_cast_36 + adder_add_cast_37;

  sum19 <= sum19_temp(15 DOWNTO 0);

  coeff21 <= to_signed(-16#002F#, 16);

  multiplier_mul_temp_18 <= delay_pipeline_19 * coeff21;
  product21 <= multiplier_mul_temp_18(43 DOWNTO 28);

  adder_add_cast_38 <= resize(sum19, 17);
  adder_add_cast_39 <= resize(product21, 17);
  sum20_temp <= adder_add_cast_38 + adder_add_cast_39;

  sum20 <= sum20_temp(15 DOWNTO 0);

  coeff22 <= to_signed(-16#002F#, 16);

  multiplier_mul_temp_19 <= delay_pipeline_20 * coeff22;
  product22 <= multiplier_mul_temp_19(43 DOWNTO 28);

  adder_add_cast_40 <= resize(sum20, 17);
  adder_add_cast_41 <= resize(product22, 17);
  sum21_temp <= adder_add_cast_40 + adder_add_cast_41;

  sum21 <= sum21_temp(15 DOWNTO 0);

  coeff23 <= to_signed(-16#002E#, 16);

  multiplier_mul_temp_20 <= delay_pipeline_21 * coeff23;
  product23 <= multiplier_mul_temp_20(43 DOWNTO 28);

  adder_add_cast_42 <= resize(sum21, 17);
  adder_add_cast_43 <= resize(product23, 17);
  sum22_temp <= adder_add_cast_42 + adder_add_cast_43;

  sum22 <= sum22_temp(15 DOWNTO 0);

  coeff24 <= to_signed(-16#002B#, 16);

  multiplier_mul_temp_21 <= delay_pipeline_22 * coeff24;
  product24 <= multiplier_mul_temp_21(43 DOWNTO 28);

  adder_add_cast_44 <= resize(sum22, 17);
  adder_add_cast_45 <= resize(product24, 17);
  sum23_temp <= adder_add_cast_44 + adder_add_cast_45;

  sum23 <= sum23_temp(15 DOWNTO 0);

  coeff25 <= to_signed(-16#0028#, 16);

  multiplier_mul_temp_22 <= delay_pipeline_23 * coeff25;
  product25 <= multiplier_mul_temp_22(43 DOWNTO 28);

  adder_add_cast_46 <= resize(sum23, 17);
  adder_add_cast_47 <= resize(product25, 17);
  sum24_temp <= adder_add_cast_46 + adder_add_cast_47;

  sum24 <= sum24_temp(15 DOWNTO 0);

  coeff26 <= to_signed(-16#0023#, 16);

  multiplier_mul_temp_23 <= delay_pipeline_24 * coeff26;
  product26 <= multiplier_mul_temp_23(43 DOWNTO 28);

  adder_add_cast_48 <= resize(sum24, 17);
  adder_add_cast_49 <= resize(product26, 17);
  sum25_temp <= adder_add_cast_48 + adder_add_cast_49;

  sum25 <= sum25_temp(15 DOWNTO 0);

  coeff27 <= to_signed(-16#001C#, 16);

  multiplier_mul_temp_24 <= delay_pipeline_25 * coeff27;
  product27 <= multiplier_mul_temp_24(43 DOWNTO 28);

  adder_add_cast_50 <= resize(sum25, 17);
  adder_add_cast_51 <= resize(product27, 17);
  sum26_temp <= adder_add_cast_50 + adder_add_cast_51;

  sum26 <= sum26_temp(15 DOWNTO 0);

  coeff28 <= to_signed(-16#0015#, 16);

  multiplier_mul_temp_25 <= delay_pipeline_26 * coeff28;
  product28 <= multiplier_mul_temp_25(43 DOWNTO 28);

  adder_add_cast_52 <= resize(sum26, 17);
  adder_add_cast_53 <= resize(product28, 17);
  sum27_temp <= adder_add_cast_52 + adder_add_cast_53;

  sum27 <= sum27_temp(15 DOWNTO 0);

  coeff29 <= to_signed(-16#000C#, 16);

  multiplier_mul_temp_26 <= delay_pipeline_27 * coeff29;
  product29 <= multiplier_mul_temp_26(43 DOWNTO 28);

  adder_add_cast_54 <= resize(sum27, 17);
  adder_add_cast_55 <= resize(product29, 17);
  sum28_temp <= adder_add_cast_54 + adder_add_cast_55;

  sum28 <= sum28_temp(15 DOWNTO 0);

  delay_pipeline_28 <= delay_pipeline_1(28);

  -- coeff30
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  gain_mul_temp_2 <=  - (resize(delay_pipeline_28 & '0', 48));
  product30 <= gain_mul_temp_2(43 DOWNTO 28);

  adder_add_cast_56 <= resize(sum28, 17);
  adder_add_cast_57 <= resize(product30, 17);
  sum29_temp <= adder_add_cast_56 + adder_add_cast_57;

  sum29 <= sum29_temp(15 DOWNTO 0);

  coeff31 <= to_signed(16#000A#, 16);

  multiplier_mul_temp_27 <= delay_pipeline_29 * coeff31;
  product31 <= multiplier_mul_temp_27(43 DOWNTO 28);

  adder_add_cast_58 <= resize(sum29, 17);
  adder_add_cast_59 <= resize(product31, 17);
  sum30_temp <= adder_add_cast_58 + adder_add_cast_59;

  sum30 <= sum30_temp(15 DOWNTO 0);

  coeff32 <= to_signed(16#0017#, 16);

  multiplier_mul_temp_28 <= delay_pipeline_30 * coeff32;
  product32 <= multiplier_mul_temp_28(43 DOWNTO 28);

  adder_add_cast_60 <= resize(sum30, 17);
  adder_add_cast_61 <= resize(product32, 17);
  sum31_temp <= adder_add_cast_60 + adder_add_cast_61;

  sum31 <= sum31_temp(15 DOWNTO 0);

  coeff33 <= to_signed(16#0025#, 16);

  multiplier_mul_temp_29 <= delay_pipeline_31 * coeff33;
  product33 <= multiplier_mul_temp_29(43 DOWNTO 28);

  adder_add_cast_62 <= resize(sum31, 17);
  adder_add_cast_63 <= resize(product33, 17);
  sum32_temp <= adder_add_cast_62 + adder_add_cast_63;

  sum32 <= sum32_temp(15 DOWNTO 0);

  coeff34 <= to_signed(16#0035#, 16);

  multiplier_mul_temp_30 <= delay_pipeline_32 * coeff34;
  product34 <= multiplier_mul_temp_30(43 DOWNTO 28);

  adder_add_cast_64 <= resize(sum32, 17);
  adder_add_cast_65 <= resize(product34, 17);
  sum33_temp <= adder_add_cast_64 + adder_add_cast_65;

  sum33 <= sum33_temp(15 DOWNTO 0);

  coeff35 <= to_signed(16#0046#, 16);

  multiplier_mul_temp_31 <= delay_pipeline_33 * coeff35;
  product35 <= multiplier_mul_temp_31(43 DOWNTO 28);

  adder_add_cast_66 <= resize(sum33, 17);
  adder_add_cast_67 <= resize(product35, 17);
  sum34_temp <= adder_add_cast_66 + adder_add_cast_67;

  sum34 <= sum34_temp(15 DOWNTO 0);

  Discrete_FIR_Filter_out <= std_logic_vector(sum34);

END rtl;

