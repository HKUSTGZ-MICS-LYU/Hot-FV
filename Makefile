# Paths
CURRENT_DIR := $(shell pwd)
PONO_PATH = $(CURRENT_DIR)/pono/pono
SMALL_PATH = $(CURRENT_DIR)/benchmark/RocketTile_Small
TINY_PATH = $(CURRENT_DIR)/benchmark/RocketTile_Tiny
OR1200_PATH = $(CURRENT_DIR)/benchmark/or1200
B01_PATH = $(CURRENT_DIR)/benchmark/b01
B06_PATH = $(CURRENT_DIR)/benchmark/b06
B10_PATH = $(CURRENT_DIR)/benchmark/b10
B11_PATH = $(CURRENT_DIR)/benchmark/b11
B12_PATH = $(CURRENT_DIR)/benchmark/b12
B14_PATH = $(CURRENT_DIR)/benchmark/b14
OR1200_DCACHE_PATH = $(CURRENT_DIR)/benchmark/or1200_DCache
OR1200_ICACHE_PATH = $(CURRENT_DIR)/benchmark/or1200_ICache
OR1200_EXCEPTION_PATH = $(CURRENT_DIR)/benchmark/or1200_Exception


# Determine if -without_imd should be included
WITHOUT_IMD_FLAG := 
ifeq ($(WITHOUT_IMD),1)
    WITHOUT_IMD_FLAG := -without_imd
endif

WITHOUT_ORD_FLAG := 
ifeq ($(WITHOUT_ORD),1)
    WITHOUT_ORD_FLAG := -use_random_ordering
endif


# Default target
all: help

# Help target
help:
	@echo "Available targets:"
	@echo "  make RocketTile_Small"
	@echo "  make RocketTile_Tiny"
	@echo "  make b12"
	@echo "  make or1200"

# Dependency for idx.txt in Tiny
$(TINY_PATH)/idx.txt: $(TINY_PATH)/RocketTile_dut.v $(TINY_PATH)/RocketTile_dut.btor
	python script/gen_idx.py \
		-verilog_file $(TINY_PATH)/RocketTile_dut.v \
		-btor_file $(TINY_PATH)/RocketTile_dut.btor \
		-output_idx $(TINY_PATH)/idx.txt


b01: $(B01_PATH)/b01_dut.btor
	python3 src/run.py \
		-data_file $(B01_PATH)/b01_dut.btor \
		-collecting_path $(B01_PATH)/result_$(BATCH) \
		-verify_idx $(B01_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B01_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
        $(WITHOUT_ORD_FLAG)

# Target for b06
b06: $(B06_PATH)/b06_dut.btor
	python3 src/run.py \
		-data_file $(B06_PATH)/b06_dut.btor \
		-collecting_path $(B06_PATH)/result_$(BATCH) \
		-verify_idx $(B06_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B06_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for b06_dut.btor
$(B06_PATH)/b06_dut.btor: $(B06_PATH)/b06.ys
	cd $(B06_PATH) && yosys b06.ys


# Target for b10
b10: $(B10_PATH)/b10_dut.btor
	python3 src/run.py \
		-data_file $(B10_PATH)/b10_dut.btor \
		-collecting_path $(B10_PATH)/result_$(BATCH) \
		-verify_idx $(B10_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B10_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for b10_dut.btor
$(B10_PATH)/b10_dut.btor: $(B10_PATH)/b10.ys
	cd $(B10_PATH) && yosys b10.ys


# Target for b11
b11: $(B11_PATH)/b11_dut.btor
	python3 src/run.py \
		-data_file $(B11_PATH)/b11_dut.btor \
		-collecting_path $(B11_PATH)/result_$(BATCH) \
		-verify_idx $(B11_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B11_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for b11_dut.btor
$(B11_PATH)/b11_dut.btor: $(B11_PATH)/b11.ys
	cd $(B11_PATH) && yosys b11.ys

b12: $(B12_PATH)/b12_dut.btor $(B12_PATH)/idx.txt
	python3 src/run.py \
		-data_file $(B12_PATH)/b12_dut.btor \
		-collecting_path $(B12_PATH)/result_$(BATCH) \
		-verify_idx $(B12_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B12_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
        $(WITHOUT_ORD_FLAG)

# Target for b14
b14: $(B14_PATH)/b14_dut.btor
	python3 src/run.py \
		-data_file $(B14_PATH)/b14_dut.btor \
		-collecting_path $(B14_PATH)/result_$(BATCH) \
		-verify_idx $(B14_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(B14_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for b14_dut.btor
$(B14_PATH)/b14_dut.btor: $(B14_PATH)/b14.ys
	cd $(B14_PATH) && yosys b14.ys

# Target for or1200
or1200: $(OR1200_PATH)/or1200_dut.btor $(OR1200_PATH)/idx.txt
	python3 src/run.py \
		-data_file $(OR1200_PATH)/or1200_dut.btor \
		-collecting_path $(OR1200_PATH)/result_$(BATCH) \
		-verify_idx $(OR1200_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(OR1200_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
        $(WITHOUT_ORD_FLAG)

# Dependency for or1200_dut.btor
$(OR1200_PATH)/or1200_dut.btor: $(OR1200_PATH)/or1200.ys
	cd $(OR1200_PATH) && yosys or1200.ys

# Dependency for idx.txt in or1200
$(OR1200_PATH)/idx.txt: $(OR1200_PATH)/or1200_dut.v $(OR1200_PATH)/or1200_dut.btor
	python script/gen_idx.py \
		-verilog_file $(OR1200_PATH)/or1200_dut.v \
		-btor_file $(OR1200_PATH)/or1200_dut.btor \
		-output_idx $(OR1200_PATH)/idx.txt

# Target for or1200_DCache
or1200_DCache: $(OR1200_DCACHE_PATH)/or1200_dc_fsm_dut.btor
	python3 src/run.py \
		-data_file $(OR1200_DCACHE_PATH)/or1200_dc_fsm_dut.btor \
		-collecting_path $(OR1200_DCACHE_PATH)/result_$(BATCH) \
		-verify_idx $(OR1200_DCACHE_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(OR1200_DCACHE_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for or1200_dc_fsm_dut.btor
$(OR1200_DCACHE_PATH)/or1200_dc_fsm_dut.btor: $(OR1200_DCACHE_PATH)/or1200_dc_fsm.ys
	cd $(OR1200_DCACHE_PATH) && yosys or1200_dc_fsm.ys


# Target for or1200_ICache
or1200_ICache: $(OR1200_ICACHE_PATH)/or1200_ic_fsm_dut.btor
	python3 src/run.py \
		-data_file $(OR1200_ICACHE_PATH)/or1200_ic_fsm_dut.btor \
		-collecting_path $(OR1200_ICACHE_PATH)/result_$(BATCH) \
		-verify_idx $(OR1200_ICACHE_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(OR1200_ICACHE_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for or1200_ic_fsm_dut.btor
$(OR1200_ICACHE_PATH)/or1200_ic_fsm_dut.btor: $(OR1200_ICACHE_PATH)/or1200_ic_fsm.ys
	cd $(OR1200_ICACHE_PATH) && yosys or1200_ic_fsm.ys


# Target for or1200_Exception
or1200_Exception: $(OR1200_EXCEPTION_PATH)/or1200_except_dut.btor
	python3 src/run.py \
		-data_file $(OR1200_EXCEPTION_PATH)/or1200_except_dut.btor \
		-collecting_path $(OR1200_EXCEPTION_PATH)/result_$(BATCH) \
		-verify_idx $(OR1200_EXCEPTION_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(OR1200_EXCEPTION_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
		$(WITHOUT_ORD_FLAG)

# Dependency for or1200_except_dut.btor
$(OR1200_EXCEPTION_PATH)/or1200_except_dut.btor: $(OR1200_EXCEPTION_PATH)/or1200_except.ys
	cd $(OR1200_EXCEPTION_PATH) && yosys or1200_except.ys

# Target for RocketTile_Small
RocketTile_Small: $(SMALL_PATH)/RocketTile_dut.btor $(SMALL_PATH)/idx.txt
	python3 src/run.py \
		-data_file $(SMALL_PATH)/RocketTile_dut.btor \
		-collecting_path $(SMALL_PATH)/result_$(BATCH) \
		-verify_idx $(SMALL_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(SMALL_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
        $(WITHOUT_ORD_FLAG)
		

# Dependency for RocketTile_dut.btor
$(SMALL_PATH)/RocketTile_dut.btor: $(SMALL_PATH)/RocketTile_Small_novcd.ys
	cd $(SMALL_PATH) && yosys RocketTile_Small_novcd.ys

# Dependency for idx.txt
$(SMALL_PATH)/idx.txt: $(SMALL_PATH)/RocketTile_dut.v $(SMALL_PATH)/RocketTile_dut.btor
	python script/gen_idx.py \
		-verilog_file $(SMALL_PATH)/RocketTile_dut.v \
		-btor_file $(SMALL_PATH)/RocketTile_dut.btor \
		-output_idx $(SMALL_PATH)/idx.txt

# Target for RocketTile_Tiny
RocketTile_Tiny: $(TINY_PATH)/RocketTile_dut.btor $(TINY_PATH)/idx.txt
	python3 src/run.py \
		-data_file $(TINY_PATH)/RocketTile_dut.btor \
		-collecting_path $(TINY_PATH)/result_$(BATCH) \
		-verify_idx $(TINY_PATH)/idx.txt \
		-num_cores 50 \
		-cfg_file $(TINY_PATH)/cfg.pkl \
		-pono_path $(PONO_PATH) \
		$(WITHOUT_IMD_FLAG) \
        $(WITHOUT_ORD_FLAG)

# Dependency for RocketTile_dut.btor in Tiny
$(TINY_PATH)/RocketTile_dut.btor: $(TINY_PATH)/RocketTile_Tiny_novcd.ys
	cd $(TINY_PATH) && yosys RocketTile_Tiny_novcd.ys