library(netview)
library(xlsx)
library("DT")

gracula.matrix<-read.table("hmyna_plink_genedist-matrix.mdist")
gracula.matrix1<-data.matrix(gracula.matrix)
gracula.ID<-read.xlsx("netview_gracula.xlsx", 1)

gracula.Options <- netviewOptions(selectionTitle="gracula k-Selection", nodeID="Individuals", nodeGroup="Populations", nodeColour="Colour", communityAlgorithms=c("Walktrap", "Infomap", "Fast-Greedy"))

gracula.graphs<- netview(gracula.matrix1, gracula.ID, k=1:18, cluster = TRUE, options=gracula.Options)
kPlot <- plotSelection(gracula.graphs, options=gracula.Options)

gracula.shape<-gracula.ID$Shape
gracula.shape2<-as.character(gracula.shape)

k5 <- gracula.graphs$k5
plot(k5)
plot(k5, vertex.size=7, vertex.label=NA, vertex.shape=gracula.shape2, layout=layout.kamada.kawai(k5))

#################################################################
# triangle vertex shape, run the following code

mytriangle <- function(coords, v=NULL, params) {
  vertex.color <- params("vertex", "color")
  if (length(vertex.color) != 1 && !is.null(v)) {
    vertex.color <- vertex.color[v]
  }
  vertex.size <- 1/200 * params("vertex", "size")
  if (length(vertex.size) != 1 && !is.null(v)) {
    vertex.size <- vertex.size[v]
  }
  
  symbols(x=coords[,1], y=coords[,2], bg=vertex.color,
          stars=cbind(vertex.size, vertex.size, vertex.size),
          add=TRUE, inches=FALSE)
}
# clips as a circle
add_shape("triangle", clip=shapes("circle")$clip,
          plot=mytriangle)
plot(g, vertex.shape="triangle", vertex.color=rainbow(vcount(g)),
     vertex.size=seq(10,20,length=vcount(g)))