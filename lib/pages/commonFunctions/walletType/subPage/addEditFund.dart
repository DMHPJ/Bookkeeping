import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:logger/logger.dart';

class AddEditFund extends StatefulWidget {
  final WalletTypeItemData? argument;
  const AddEditFund({super.key, this.argument});

  @override
  State<StatefulWidget> createState() {
    return _AddEditFundState();
  }
}

class _AddEditFundState extends State<AddEditFund> {
  final logger = Logger();
  final _editWalletItemFormKey = GlobalKey<FormState>();
  late WalletItemData walletItemForm;

  @override
  void initState() {
    super.initState();
    logger.i(widget.argument);
    walletItemForm = WalletItemData(
      walletType: widget.argument?.type,
      walletTypeName: widget.argument?.name,
      walletTypeIcon: widget.argument?.icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("添加/编辑")), body: Text("添加/编辑"));
  }
}
