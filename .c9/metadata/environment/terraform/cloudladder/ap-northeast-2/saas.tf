{"filter":false,"title":"saas.tf","tooltip":"/terraform/cloudladder/ap-northeast-2/saas.tf","undoManager":{"mark":22,"position":22,"stack":[[{"start":{"row":0,"column":0},"end":{"row":66,"column":1},"action":"insert","lines":["data \"aws_iam_policy_document\" \"assume_role\" {","  statement {","    effect = \"Allow\"","","    principals {","      type        = \"Service\"","      identifiers = [\"lambda.amazonaws.com\"]","    }","","    actions = [\"sts:AssumeRole\"]","  }","}","","resource \"aws_iam_role\" \"iam_for_lambda\" {","  name               = \"iam_for_lambda\"","  assume_role_policy = data.aws_iam_policy_document.assume_role.json","}","","data \"archive_file\" \"personalize_lambda\" {","  type        = \"zip\"","  source_file = \"personalize_lambda.py\"","  output_path = \"personalize_lambda.zip\"","}","","data \"archive_file\" \"connect_lambda\" {","  type        = \"zip\"","  source_file = \"connect_lambda.py\"","  output_path = \"connect_lambda.zip\"","}","","resource \"aws_lambda_function\" \"personalize_lambda\" {","  # If the file is not in the current working directory you will need to include a","  # path.module in the filename.","  filename      = \"personalize_lambda.zip\"","  function_name = \"personalize_lambda\"","  role          = aws_iam_role.iam_for_lambda.arn","  handler       = \"index.test\"","","  source_code_hash = data.archive_file.personalize_lambda.output_base64sha256","","  runtime = \"python3.8\"","","  environment {","    variables = {","      foo = \"bar\"","    }","  }","}","","resource \"aws_lambda_function\" \"connect_lambda\" {","  # If the file is not in the current working directory you will need to include a","  # path.module in the filename.","  filename      = \"connect_lambda.zip\"","  function_name = \"connect_lambda\"","  role          = aws_iam_role.iam_for_lambda.arn","  handler       = \"index.test\"","","  source_code_hash = data.archive_file.connect_lambda.output_base64sha256","","  runtime = \"python3.8\"","","  environment {","    variables = {","      foo = \"bar\"","    }","  }","}"],"id":1}],[{"start":{"row":0,"column":0},"end":{"row":16,"column":1},"action":"remove","lines":["data \"aws_iam_policy_document\" \"assume_role\" {","  statement {","    effect = \"Allow\"","","    principals {","      type        = \"Service\"","      identifiers = [\"lambda.amazonaws.com\"]","    }","","    actions = [\"sts:AssumeRole\"]","  }","}","","resource \"aws_iam_role\" \"iam_for_lambda\" {","  name               = \"iam_for_lambda\"","  assume_role_policy = data.aws_iam_policy_document.assume_role.json","}"],"id":2}],[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"insert","lines":["#"],"id":3}],[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"remove","lines":["#"],"id":4},{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":0,"column":0},"end":{"row":7,"column":1},"action":"insert","lines":["data \"terraform_remote_state\" \"acm\" {","  backend = \"s3\"","  config = {","    bucket = \"cloudwave-cloudladder-tfstate\"","    key = \"ap-infra/terraform.tfstate\"","    region = \"ap-northeast-2\"","  }","}"],"id":5}],[{"start":{"row":7,"column":1},"end":{"row":8,"column":0},"action":"insert","lines":["",""],"id":6}],[{"start":{"row":0,"column":31},"end":{"row":0,"column":34},"action":"remove","lines":["acm"],"id":7},{"start":{"row":0,"column":31},"end":{"row":0,"column":32},"action":"insert","lines":["i"]},{"start":{"row":0,"column":32},"end":{"row":0,"column":33},"action":"insert","lines":["n"]},{"start":{"row":0,"column":33},"end":{"row":0,"column":34},"action":"insert","lines":["f"]},{"start":{"row":0,"column":34},"end":{"row":0,"column":35},"action":"insert","lines":["r"]},{"start":{"row":0,"column":35},"end":{"row":0,"column":36},"action":"insert","lines":["a"]}],[{"start":{"row":4,"column":14},"end":{"row":4,"column":19},"action":"remove","lines":["infra"],"id":8},{"start":{"row":4,"column":13},"end":{"row":4,"column":14},"action":"remove","lines":["-"]},{"start":{"row":4,"column":12},"end":{"row":4,"column":13},"action":"remove","lines":["p"]},{"start":{"row":4,"column":11},"end":{"row":4,"column":12},"action":"remove","lines":["a"]}],[{"start":{"row":4,"column":11},"end":{"row":4,"column":12},"action":"insert","lines":["g"],"id":9},{"start":{"row":4,"column":12},"end":{"row":4,"column":13},"action":"insert","lines":["l"]},{"start":{"row":4,"column":13},"end":{"row":4,"column":14},"action":"insert","lines":["o"]},{"start":{"row":4,"column":14},"end":{"row":4,"column":15},"action":"insert","lines":["b"]},{"start":{"row":4,"column":15},"end":{"row":4,"column":16},"action":"insert","lines":["a"]},{"start":{"row":4,"column":16},"end":{"row":4,"column":17},"action":"insert","lines":["l"]}],[{"start":{"row":26,"column":18},"end":{"row":26,"column":19},"action":"insert","lines":["d"],"id":10},{"start":{"row":26,"column":19},"end":{"row":26,"column":20},"action":"insert","lines":["a"]},{"start":{"row":26,"column":20},"end":{"row":26,"column":21},"action":"insert","lines":["t"]},{"start":{"row":26,"column":21},"end":{"row":26,"column":22},"action":"insert","lines":["a"]},{"start":{"row":26,"column":22},"end":{"row":26,"column":23},"action":"insert","lines":["."]},{"start":{"row":26,"column":23},"end":{"row":26,"column":24},"action":"insert","lines":["t"]},{"start":{"row":26,"column":24},"end":{"row":26,"column":25},"action":"insert","lines":["e"]},{"start":{"row":26,"column":25},"end":{"row":26,"column":26},"action":"insert","lines":["r"]}],[{"start":{"row":26,"column":23},"end":{"row":26,"column":26},"action":"remove","lines":["ter"],"id":11},{"start":{"row":26,"column":23},"end":{"row":26,"column":45},"action":"insert","lines":["terraform_remote_state"]}],[{"start":{"row":26,"column":45},"end":{"row":26,"column":46},"action":"insert","lines":["."],"id":12},{"start":{"row":26,"column":46},"end":{"row":26,"column":47},"action":"insert","lines":["i"]},{"start":{"row":26,"column":47},"end":{"row":26,"column":48},"action":"insert","lines":["n"]}],[{"start":{"row":26,"column":46},"end":{"row":26,"column":48},"action":"remove","lines":["in"],"id":13},{"start":{"row":26,"column":46},"end":{"row":26,"column":48},"action":"insert","lines":["in"]}],[{"start":{"row":26,"column":48},"end":{"row":26,"column":49},"action":"insert","lines":["f"],"id":14}],[{"start":{"row":26,"column":46},"end":{"row":26,"column":49},"action":"remove","lines":["inf"],"id":15},{"start":{"row":26,"column":46},"end":{"row":26,"column":51},"action":"insert","lines":["infra"]}],[{"start":{"row":26,"column":51},"end":{"row":26,"column":52},"action":"insert","lines":["."],"id":16},{"start":{"row":26,"column":52},"end":{"row":26,"column":53},"action":"insert","lines":["o"]},{"start":{"row":26,"column":53},"end":{"row":26,"column":54},"action":"insert","lines":["u"]},{"start":{"row":26,"column":54},"end":{"row":26,"column":55},"action":"insert","lines":["p"]},{"start":{"row":26,"column":55},"end":{"row":26,"column":56},"action":"insert","lines":["u"]},{"start":{"row":26,"column":56},"end":{"row":26,"column":57},"action":"insert","lines":["t"]}],[{"start":{"row":26,"column":57},"end":{"row":26,"column":58},"action":"insert","lines":["s"],"id":17},{"start":{"row":26,"column":58},"end":{"row":26,"column":59},"action":"insert","lines":["."]}],[{"start":{"row":26,"column":59},"end":{"row":26,"column":71},"action":"remove","lines":["aws_iam_role"],"id":18},{"start":{"row":26,"column":59},"end":{"row":26,"column":60},"action":"remove","lines":["."]}],[{"start":{"row":26,"column":76},"end":{"row":26,"column":77},"action":"remove","lines":["n"],"id":19},{"start":{"row":26,"column":75},"end":{"row":26,"column":76},"action":"remove","lines":["r"]},{"start":{"row":26,"column":74},"end":{"row":26,"column":75},"action":"remove","lines":["a"]},{"start":{"row":26,"column":73},"end":{"row":26,"column":74},"action":"remove","lines":["."]}],[{"start":{"row":45,"column":18},"end":{"row":45,"column":49},"action":"remove","lines":["aws_iam_role.iam_for_lambda.arn"],"id":20},{"start":{"row":45,"column":18},"end":{"row":45,"column":73},"action":"insert","lines":["data.terraform_remote_state.infra.ouputs.iam_for_lambda"]}],[{"start":{"row":45,"column":54},"end":{"row":45,"column":55},"action":"insert","lines":["t"],"id":21}],[{"start":{"row":26,"column":54},"end":{"row":26,"column":55},"action":"insert","lines":["t"],"id":22}],[{"start":{"row":26,"column":52},"end":{"row":26,"column":59},"action":"remove","lines":["outputs"],"id":23},{"start":{"row":26,"column":52},"end":{"row":26,"column":59},"action":"insert","lines":["outputs"]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":55,"column":5},"end":{"row":55,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1708964290807,"hash":"1fd8c7fe819137f1db63e53c9eeb851c8e041d47"}