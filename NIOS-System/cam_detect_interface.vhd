LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY cam_detect_interface IS
	PORT (
		clk, reset : IN STD_LOGIC;
		read, write, chipselect : IN STD_LOGIC;
		writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		xyData_export : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		valid, startofpacket, endofpacket : in std_logic
	);
END cam_detect_interface;
ARCHITECTURE Structure OF cam_detect_interface IS
	SIGNAL local_byteenable : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL to_reg, from_reg : STD_LOGIC_VECTOR(31 DOWNTO 0);
component cam_detect is
	port(
		clk, reset : in std_logic;
		valid, startofpacket, endofpacket : in std_logic;
		data : in std_logic_vector(23 downto 0);
		xyData : out std_logic_vector(31 downto 0));
		xyDataIN : in std_logic_vector(31 downto 0));
		byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
end component cam_detect;
BEGIN
	to_reg <= writedata;
	WITH (chipselect AND write) SELECT
	local_byteenable <= byteenable WHEN '1', "0000" WHEN OTHERS;
	cam_instance : cam_detect
	PORT MAP(clk, reset, valid, startofpacket, endofpacket, from_reg, to_reg, local_byteenable);
	readdata <= from_reg;
	xyData_export <= from_reg;
END Structure;