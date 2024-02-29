{"filter":false,"title":"eks.tf","tooltip":"/terraform/cloudladder/ap-northeast-2/prod/eks.tf","undoManager":{"mark":43,"position":43,"stack":[[{"start":{"row":34,"column":4},"end":{"row":34,"column":7},"action":"remove","lines":["dev"],"id":2},{"start":{"row":34,"column":4},"end":{"row":34,"column":8},"action":"insert","lines":["prod"]}],[{"start":{"row":48,"column":4},"end":{"row":48,"column":7},"action":"remove","lines":["dev"],"id":3},{"start":{"row":48,"column":4},"end":{"row":48,"column":8},"action":"insert","lines":["prod"]}],[{"start":{"row":53,"column":8},"end":{"row":53,"column":11},"action":"remove","lines":["dev"],"id":4},{"start":{"row":53,"column":8},"end":{"row":53,"column":12},"action":"insert","lines":["prod"]}],[{"start":{"row":77,"column":45},"end":{"row":77,"column":48},"action":"remove","lines":["dev"],"id":5},{"start":{"row":77,"column":45},"end":{"row":77,"column":49},"action":"insert","lines":["prod"]}],[{"start":{"row":38,"column":0},"end":{"row":38,"column":87},"action":"remove","lines":["      policy_arn = \"arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy\""],"id":6},{"start":{"row":37,"column":22},"end":{"row":38,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":41,"column":5},"end":{"row":42,"column":0},"action":"insert","lines":["",""],"id":7},{"start":{"row":42,"column":0},"end":{"row":42,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":42,"column":2},"end":{"row":42,"column":4},"action":"remove","lines":["  "],"id":8},{"start":{"row":42,"column":0},"end":{"row":42,"column":2},"action":"remove","lines":["  "]}],[{"start":{"row":42,"column":0},"end":{"row":47,"column":7},"action":"insert","lines":["      node_group_policies = [","        \"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly\",","        \"arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy\",","        \"arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy\",","        \"arn:aws:iam::aws:policy/AdministratorAccess\",","      ]"],"id":9}],[{"start":{"row":42,"column":0},"end":{"row":47,"column":7},"action":"remove","lines":["      node_group_policies = [","        \"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly\",","        \"arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy\",","        \"arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy\",","        \"arn:aws:iam::aws:policy/AdministratorAccess\",","      ]"],"id":10}],[{"start":{"row":41,"column":5},"end":{"row":42,"column":0},"action":"remove","lines":["",""],"id":11}],[{"start":{"row":40,"column":29},"end":{"row":41,"column":0},"action":"insert","lines":["",""],"id":12},{"start":{"row":41,"column":0},"end":{"row":41,"column":6},"action":"insert","lines":["      "]}],[{"start":{"row":41,"column":4},"end":{"row":41,"column":6},"action":"remove","lines":["  "],"id":13},{"start":{"row":41,"column":2},"end":{"row":41,"column":4},"action":"remove","lines":["  "]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"remove","lines":["  "]}],[{"start":{"row":41,"column":0},"end":{"row":46,"column":7},"action":"insert","lines":["      node_group_policies = [","        \"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly\",","        \"arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy\",","        \"arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy\",","        \"arn:aws:iam::aws:policy/AdministratorAccess\",","      ]"],"id":14}],[{"start":{"row":41,"column":0},"end":{"row":46,"column":7},"action":"remove","lines":["      node_group_policies = [","        \"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly\",","        \"arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy\",","        \"arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy\",","        \"arn:aws:iam::aws:policy/AdministratorAccess\",","      ]"],"id":15},{"start":{"row":40,"column":29},"end":{"row":41,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":40,"column":29},"end":{"row":41,"column":0},"action":"insert","lines":["",""],"id":16},{"start":{"row":41,"column":0},"end":{"row":41,"column":6},"action":"insert","lines":["      "]}],[{"start":{"row":41,"column":6},"end":{"row":41,"column":35},"action":"insert","lines":["iam_role_additional_policies "],"id":17}],[{"start":{"row":41,"column":35},"end":{"row":41,"column":36},"action":"insert","lines":[" "],"id":18},{"start":{"row":41,"column":36},"end":{"row":41,"column":37},"action":"insert","lines":["="]}],[{"start":{"row":41,"column":37},"end":{"row":41,"column":38},"action":"insert","lines":[" "],"id":19}],[{"start":{"row":41,"column":38},"end":{"row":41,"column":111},"action":"insert","lines":["[\"${local.iam_role_policy_prefix}/${module.iam_policy_autoscaling.name}\"]"],"id":20}],[{"start":{"row":41,"column":39},"end":{"row":41,"column":110},"action":"remove","lines":["\"${local.iam_role_policy_prefix}/${module.iam_policy_autoscaling.name}\""],"id":21}],[{"start":{"row":41,"column":39},"end":{"row":41,"column":82},"action":"insert","lines":["arn:aws:iam::aws:policy/AdministratorAccess"],"id":22}],[{"start":{"row":41,"column":39},"end":{"row":41,"column":40},"action":"insert","lines":["\""],"id":23}],[{"start":{"row":41,"column":83},"end":{"row":41,"column":84},"action":"insert","lines":["\""],"id":24}],[{"start":{"row":41,"column":6},"end":{"row":41,"column":85},"action":"remove","lines":["iam_role_additional_policies  = [\"arn:aws:iam::aws:policy/AdministratorAccess\"]"],"id":25}],[{"start":{"row":41,"column":4},"end":{"row":41,"column":6},"action":"remove","lines":["  "],"id":26},{"start":{"row":41,"column":2},"end":{"row":41,"column":4},"action":"remove","lines":["  "]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"remove","lines":["  "]},{"start":{"row":40,"column":29},"end":{"row":41,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":30,"column":73},"end":{"row":31,"column":0},"action":"insert","lines":["",""],"id":27},{"start":{"row":31,"column":0},"end":{"row":31,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":31,"column":4},"end":{"row":31,"column":83},"action":"insert","lines":["iam_role_additional_policies  = [\"arn:aws:iam::aws:policy/AdministratorAccess\"]"],"id":28}],[{"start":{"row":31,"column":37},"end":{"row":32,"column":0},"action":"insert","lines":["",""],"id":29},{"start":{"row":32,"column":0},"end":{"row":32,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":32,"column":49},"end":{"row":33,"column":0},"action":"insert","lines":["",""],"id":30},{"start":{"row":33,"column":0},"end":{"row":33,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":31,"column":36},"end":{"row":31,"column":37},"action":"remove","lines":["["],"id":31}],[{"start":{"row":31,"column":36},"end":{"row":31,"column":38},"action":"insert","lines":["[]"],"id":32}],[{"start":{"row":31,"column":37},"end":{"row":32,"column":0},"action":"insert","lines":["",""],"id":33},{"start":{"row":32,"column":0},"end":{"row":32,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":32,"column":4},"end":{"row":32,"column":5},"action":"remove","lines":["]"],"id":34},{"start":{"row":32,"column":4},"end":{"row":33,"column":0},"action":"remove","lines":["",""]},{"start":{"row":32,"column":4},"end":{"row":32,"column":6},"action":"remove","lines":["  "]},{"start":{"row":32,"column":4},"end":{"row":32,"column":6},"action":"remove","lines":["  "]}],[{"start":{"row":30,"column":73},"end":{"row":31,"column":0},"action":"insert","lines":["",""],"id":46},{"start":{"row":31,"column":0},"end":{"row":31,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":31,"column":4},"end":{"row":33,"column":3},"action":"insert","lines":["  iam_role_additional_policies = {","    additional = aws_iam_policy.additional.arn","  }"],"id":47}],[{"start":{"row":31,"column":4},"end":{"row":31,"column":6},"action":"remove","lines":["  "],"id":48}],[{"start":{"row":31,"column":35},"end":{"row":31,"column":36},"action":"remove","lines":["{"],"id":49}],[{"start":{"row":31,"column":35},"end":{"row":31,"column":36},"action":"insert","lines":["{"],"id":50}],[{"start":{"row":31,"column":36},"end":{"row":33,"column":5},"action":"insert","lines":["","      ","    }"],"id":51}],[{"start":{"row":32,"column":6},"end":{"row":32,"column":48},"action":"insert","lines":["additional = aws_iam_policy.additional.arn"],"id":52}],[{"start":{"row":32,"column":19},"end":{"row":32,"column":48},"action":"remove","lines":["aws_iam_policy.additional.arn"],"id":53},{"start":{"row":32,"column":19},"end":{"row":32,"column":62},"action":"insert","lines":["arn:aws:iam::aws:policy/AdministratorAccess"]}],[{"start":{"row":34,"column":0},"end":{"row":38,"column":5},"action":"remove","lines":["    additional = aws_iam_policy.additional.arn","  }","    iam_role_additional_policies  = [","    \"arn:aws:iam::aws:policy/AdministratorAccess\"","    ]"],"id":54},{"start":{"row":33,"column":5},"end":{"row":34,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":32,"column":62},"end":{"row":32,"column":63},"action":"insert","lines":["\""],"id":55}],[{"start":{"row":32,"column":19},"end":{"row":32,"column":20},"action":"insert","lines":["\""],"id":56}]]},"ace":{"folds":[],"scrolltop":375,"scrollleft":0,"selection":{"start":{"row":31,"column":0},"end":{"row":33,"column":5},"isBackwards":true},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":17,"state":"start","mode":"ace/mode/terraform"}},"timestamp":1708982349600,"hash":"cf26e8a4ac721ad23ed2550ffba4a06568d59ef9"}