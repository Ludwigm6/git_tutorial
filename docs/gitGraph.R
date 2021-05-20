library(DiagrammeR)


graph_local <- create_graph() %>% 
    add_node(label = "Local \n Workspace", node_aes = node_aes(shape = "rectangle",fixedsize = FALSE)) %>% 
    add_node(label = "Repository", node_aes = node_aes(shape = "rectangle", fixedsize = FALSE)) %>% 
    add_node(label = "Index", node_aes = node_aes(shape = "circle")) %>% 
    add_edge(from = 1, to = 3, edge_aes = edge_aes(label = "add", style = "dashed")) %>% 
    add_edge(from = 3, to = 2, edge_aes = edge_aes(label = "commit", style = "dashed"))



render_graph(graph_local, layout = "tree")



graph_remote <- graph_local %>% 
    add_node(label = "Remote", node_aes = node_aes(shape = "rectangle", fixedsize = FALSE)) %>% 
    add_edge(from = 2, to = 4, edge_aes = edge_aes(headlabel = "push", style = "dashed")) %>% 
    add_edge(from = 4, to = 2, edge_aes = edge_aes(headlabel = "fetch", style = "dashed")) %>% 
    add_edge(from = 4, to = 1, edge_aes = edge_aes(label = "clone", style = "dotted")) %>% 
    add_edge(from = 4, to = 1, edge_aes = edge_aes(label = "pull", style = "solid")) %>% 
    add_edge(from = 4, to = 2, edge_aes = edge_aes(label = "pull", style = "solid")) 
render_graph(graph_remote, layout = "tree")


graph_remote <- graph_remote %>% 
    set_node_position(1, x = 4, y =  1) %>% 
    set_node_position(2, x = 2, y = 1) %>% 
    set_node_position(3, x = 3, y = 0) %>% 
    set_node_position(4, x = 3, y = 3)


render_graph(graph_remote)
