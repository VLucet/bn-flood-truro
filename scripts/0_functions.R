# The following function works but the implementation is very far from ideal, as
# it doesn't properly model the recursion present in the data, and naively uses 
# switch cases. But it will do for this use case.

clean_tables <- function(tbl, element_names = "tmp"){
  
  if ("tbl_df" %in% class(tbl)){
    tbl_rownames <- unname(unlist(as.data.frame(tbl[,1])))
    tbl <- as.matrix(tbl[,-1])
    rownames(tbl) <- tbl_rownames
  }
  
  if (ncol(tbl) == 1){
    
    tmp_list <- list(tmp = rownames(tbl))
    names(tmp_list) <- element_names
    result <- array(tbl, dim = 2, dimnames = (tmp_list))
    
  } else if (ncol(tbl) == 2){
    
    temp_list <- list(tmp = rownames(tbl), tmp2 = colnames(tbl))
    names(temp_list) <- element_names
    dimnames(tbl) <- temp_list
    result <- tbl
    
  } else if (ncol(tbl) == 4){
    
    all_names <- colnames(tbl)
    
    third_dim_list <- lapply(strsplit(all_names, ":"), `[`, 2)
    second_dim_list <- lapply(strsplit(all_names, ":"), `[`, 1)
    
    third_dim <- unlist(third_dim_list)
    second_dim <- unlist(second_dim_list)
    
    third_dim_levels <- unique(third_dim)
    second_dim_levels <- unique(second_dim)
    
    index <- which(third_dim == third_dim_levels[1])
    split_1 <- tbl[, c(index)]
    colnames(split_1) <- second_dim[index]
    
    index_2 <- which(third_dim == third_dim_levels[2])
    split_2 <- tbl[, c(index_2)]
    colnames(split_2) <- third_dim[index_2]
    
    split_1 <- clean_tables(split_1, element_names[c(1,2)])
    split_2 <- clean_tables(split_2, element_names[c(1,3)])
    
    stopifnot(rownames(split_1) == rownames(split_2))
    list_dim_names <- list(first = rownames(split_1), 
                           second = second_dim_levels, 
                           third = third_dim_levels)
    
    names(list_dim_names) <- element_names
    result <- array(c(split_1, split_2), dim = c(2,2,2), 
                    dimnames = list_dim_names)
    
  } else if (ncol(tbl == 8)) {
    
    all_names <- colnames(tbl)
    
    fourth_dim_list <- lapply(strsplit(all_names, ":"), `[`, 3)
    third_dim_list <- lapply(strsplit(all_names, ":"), `[`, 2)
    second_dim_list <- lapply(strsplit(all_names, ":"), `[`, 1)
    
    fourth_dim <- unlist(fourth_dim_list)
    third_dim <- unlist(third_dim_list)
    second_dim <- unlist(second_dim_list)
    
    fourth_dim_levels <- unique(fourth_dim)
    third_dim_levels <- unique(third_dim)
    second_dim_levels <- unique(second_dim)
    
    index <- which(fourth_dim == fourth_dim_levels[1])
    split_1 <- tbl[, c(index)]
    colnames(split_1) <- c(paste0(second_dim[index], ":", third_dim[index]))
    
    index_2 <-  which(fourth_dim == fourth_dim_levels[2])
    split_2 <- tbl[, c(index_2)]
    colnames(split_2) <- c(paste0(second_dim[index_2], ":", third_dim[index_2]))
    
    split_1_clean <- clean_tables(split_1, element_names[c(1,2,3)])
    split_2_clean <- clean_tables(split_2, element_names[c(1,2,3)])
    
    stopifnot(rownames(split_1_clean[,,1]) == rownames(split_2_clean[,,1])) ==
      stopifnot(rownames(split_1_clean[,,2]) == rownames(split_2_clean[,,2]))
    
    list_dim_names <- list(first = rownames(split_1_clean), 
                           second = second_dim_levels, 
                           third = third_dim_levels, 
                           fourth = fourth_dim_levels)
    
    names(list_dim_names) <- element_names
    result <- array(c(split_1_clean, split_2_clean), dim = c(2,2,2,2), 
                    dimnames = list_dim_names)
    
  }
  
  return(result)
}

# The following function generates a evidenced graph from a given input 
# vector of possibles states

generate_combination <- function(vec, graph = junction){
  levels <- graph$universe$levels
  levels <- levels[names(levels) != "FL" ]
  smpl <- mapply(levels, vec, FUN = `[`)
  prop_graph <- setEvidence(graph, nodes = names(smpl),
                            states = unname(smpl))
  return(prop_graph)
}
