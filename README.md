# ENCODE3_ChromHMM

This code generates the chromatin states calls for a time course across twelve tissues and seven time points of mouse development. Eight histone modifications are considered.

1. Untar ChromHMM_v1.12.tgz
2. Fix paths in pipeline.header.sh
3. Run pipeline.download.sh
4. Run pipeline.binarize.sh (editing needed depending on the job scheduler)
5. Run pipeline.learn.sh (editing needed depending on the job scheduler)
6. Run pipeline.model-15-states.1.sh (editing needed depending on the job scheduler)
7. Run pipeline.model-15-states.2.sh (editing needed depending on the job scheduler)

#### Reference

**Systematic mapping of chromatin state landscapes during mouse development**

David Gorkin, Iros Barozzi, Yanxiao Zhang, Ah Young Lee, Bin Lee, Yuan Zhao, Andre Wildberg, Bo Ding, Bo Zhang, Mengchi Wang, J. Seth Strattan, Jean M. Davidson, Yunjiang Qiu, Veena Afzal, Jennifer A. Akiyama, Ingrid Plajzer-Frick, Catherine S. Pickle, Momoe Kato, Tyler H. Garvin, Quan T. Pham, Anne N. Harrington, Brandon J. Mannion, Elizabeth A. Lee, Yoko Fukuda-Yuzawa, Yupeng He, Sebastian Preissl, Sora Chee, Brian A. Williams, Diane Trout, Henry Amrhein, Hongbo Yang, J. Michael Cherry, Yin Shen, Joseph R. Ecker, Wei Wang, Diane E. Dickel, Axel Visel, Len A. Pennacchio, Bing Ren

*bioRxiv* 166652; doi: https://doi.org/10.1101/166652
