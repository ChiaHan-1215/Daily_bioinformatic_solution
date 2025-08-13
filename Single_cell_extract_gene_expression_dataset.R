# Goal: to extracted the gene of interest expression with SampleID, CellType, and other useful info from Seurat object
# Date: 08132025

library(Seurat)


lung_4 <- ReadRDS('xxx.rds)

# remember do normailzed of RNA count

DefaultAssay(lung_4) <- "RNA"
lung_4 <- NormalizeData(lung_4)

# Gene of interest
var_list <- c("SLC16A1","FUT10","AC017002.5","ATF3","GCH1")

# the "" select column of interest
vars <- c("CellType","Smoking","SampleID",
          intersect(var_list, rownames(GetAssayData(lung_4, assay="RNA", layer="data"))))

# Fetchdata
df_cells <- FetchData(lung_4, vars = vars, layer = "data")

