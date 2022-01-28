.PHONY: resume

CC = xelatex
CHINESE_DIR = ./chinese
CHINESE_OUT_DIR = ./docs
RESUME_DIR = ./chinese/resume
CV_DIR = ./chinese/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

chinese: $(foreach x, coverletter cv resume, $x.pdf)

resume-cn.pdf: $(CHINESE_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(CHINESE_OUT_DIR) $<

cv.pdf: $(CHINESE_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CHINESE_OUT_DIR) $<

coverletter.pdf: $(CHINESE_DIR)/coverletter.tex
	$(CC) -output-directory=$(CHINESE_OUT_DIR) $<

clean:
	rm -rf $(CHINESE_OUT_DIR)/*.pdf
