library(corrplot)
library(dplyr)

#지표간 상관관계
cor_AL50_Teams_idx = cor(AL50_Teams_idx)
View(cor_AL50_Teams_idx)

corrplot(cor_AL50_Teams_idx)
corrplot(cor_AL50_Teams_idx,
         type = 'lower',
         order = 'hclust',
         tl.srt = 45,
         diag = F)

idx_df = as.data.frame(cor_AL50_Teams_idx)
idx_df$idx = rownames(idx_df)

#승리와의 양의 상관관계
idx_df %>% 
    select(idx, W) %>%
    arrange(desc(W)) %>% 
    head(12)
#승리와의 음의 상관관계
idx_df %>% 
    select(idx, W) %>% 
    arrange(W) %>% 
    head(12)
#승리와의 상관관계 (절대값)
idx_df %>% 
    select(idx, W) %>% 
    arrange(desc(abs(W))) %>% 
    head(12)
#패배와의 상관관계 (절대값)
idx_df %>% 
    select(idx, L) %>% 
    arrange(desc(abs(L))) %>% 
    head(12)

#득점과의 양의 상관관계
idx_df %>% 
    select(idx, R) %>%
    filter(!(idx %in% c('OBP', 'SLG', 'OPS', 
                        'GPA', 'ISO', 'EOBP'))) %>% 
    arrange(desc(R)) %>% 
    head(12)

idx_df %>% 
    select(idx, R) %>% 
    arrange(desc(R)) %>% 
    head(12)

#실점과의 양의 상관관계
idx_df %>% 
    select(idx, RA) %>% 
    arrange(desc(RA)) %>% 
    head(12)

#OPS와의 양의 상관관계
idx_df %>% 
    select(idx, OPS) %>% 
    arrange(desc(OPS)) %>%  
    head(12)
#SLG와의 양의 상관관계
idx_df %>% 
    select(idx, SLG) %>% 
    arrange(desc(SLG)) %>% 
    head(12)
#ISO와의 양의 상관관계
idx_df %>% 
    select(idx, ISO) %>% 
    arrange(desc(ISO)) %>% 
    head(12)
#HR과의 양의 상관관계
idx_df %>% 
    select(idx, HR) %>% 
    arrange(desc(HR)) %>% 
    head(12)
