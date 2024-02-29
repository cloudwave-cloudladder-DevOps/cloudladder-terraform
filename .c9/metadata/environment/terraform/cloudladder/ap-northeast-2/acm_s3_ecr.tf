{"filter":false,"title":"acm_s3_ecr.tf","tooltip":"/terraform/cloudladder/ap-northeast-2/acm_s3_ecr.tf","undoManager":{"mark":11,"position":11,"stack":[[{"start":{"row":192,"column":0},"end":{"row":192,"column":24},"action":"remove","lines":["    force_destroy = true"],"id":2},{"start":{"row":192,"column":0},"end":{"row":193,"column":0},"action":"insert","lines":["",""]}],[{"start":{"row":193,"column":0},"end":{"row":195,"column":5},"action":"insert","lines":["    lifecycle {","        prevent_destroy = false","    }"],"id":3}],[{"start":{"row":159,"column":0},"end":{"row":160,"column":0},"action":"insert","lines":["",""],"id":4},{"start":{"row":160,"column":0},"end":{"row":161,"column":0},"action":"insert","lines":["",""]}],[{"start":{"row":160,"column":0},"end":{"row":173,"column":1},"action":"insert","lines":["resource \"aws_ecr_repository\" \"node_repository\" {","  name = \"node_cloudladder\"","  image_tag_mutability = \"MUTABLE\"","  force_delete = true","","  image_scanning_configuration {","    scan_on_push = true","  }","}","","output \"node_repository_url\" {","  description = \"The URL of the repository.\"","  value = aws_ecr_repository.node_repository.repository_url","}"],"id":5}],[{"start":{"row":160,"column":34},"end":{"row":160,"column":35},"action":"remove","lines":["e"],"id":6},{"start":{"row":160,"column":33},"end":{"row":160,"column":34},"action":"remove","lines":["d"]},{"start":{"row":160,"column":32},"end":{"row":160,"column":33},"action":"remove","lines":["o"]},{"start":{"row":160,"column":31},"end":{"row":160,"column":32},"action":"remove","lines":["n"]}],[{"start":{"row":160,"column":31},"end":{"row":160,"column":32},"action":"insert","lines":["j"],"id":7},{"start":{"row":160,"column":32},"end":{"row":160,"column":33},"action":"insert","lines":["e"]}],[{"start":{"row":160,"column":32},"end":{"row":160,"column":33},"action":"remove","lines":["e"],"id":8}],[{"start":{"row":160,"column":32},"end":{"row":160,"column":33},"action":"insert","lines":["m"],"id":9},{"start":{"row":160,"column":33},"end":{"row":160,"column":34},"action":"insert","lines":["e"]},{"start":{"row":160,"column":34},"end":{"row":160,"column":35},"action":"insert","lines":["t"]},{"start":{"row":160,"column":35},"end":{"row":160,"column":36},"action":"insert","lines":["e"]},{"start":{"row":160,"column":36},"end":{"row":160,"column":37},"action":"insert","lines":["r"]}],[{"start":{"row":161,"column":10},"end":{"row":161,"column":26},"action":"remove","lines":["node_cloudladder"],"id":10},{"start":{"row":161,"column":10},"end":{"row":161,"column":27},"action":"insert","lines":["jmeter_repository"]}],[{"start":{"row":170,"column":8},"end":{"row":170,"column":27},"action":"remove","lines":["node_repository_url"],"id":11},{"start":{"row":170,"column":8},"end":{"row":170,"column":25},"action":"insert","lines":["jmeter_repository"]}],[{"start":{"row":170,"column":25},"end":{"row":170,"column":26},"action":"insert","lines":["_"],"id":12},{"start":{"row":170,"column":26},"end":{"row":170,"column":27},"action":"insert","lines":["u"]},{"start":{"row":170,"column":27},"end":{"row":170,"column":28},"action":"insert","lines":["r"]},{"start":{"row":170,"column":28},"end":{"row":170,"column":29},"action":"insert","lines":["l"]}],[{"start":{"row":172,"column":29},"end":{"row":172,"column":44},"action":"remove","lines":["node_repository"],"id":13},{"start":{"row":172,"column":29},"end":{"row":172,"column":46},"action":"insert","lines":["jmeter_repository"]}]]},"ace":{"folds":[],"scrolltop":2142,"scrollleft":0,"selection":{"start":{"row":183,"column":0},"end":{"row":183,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":152,"state":"start","mode":"ace/mode/terraform"}},"timestamp":1709025715702,"hash":"8d2a36cbeb6839040ec3378db95fa78ea047134f"}