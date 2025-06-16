
class NeedApprovalData {
  String? id;
  int? type;
  String? actions;
  String? logsId;
  NeedApprovalBody? body;
  bool? isRead;
  bool? isFinance;
  String? requestBenefitId;
  String? transactionId;
  String? requestReimbursementId;
  NeedApprovalSender? sender;
  RequestReimbursement? requestReimbursement;
  NeedApprovalClaimBenefit? claimBenefit;
  NeedApprovalTimeoff? timeoff;

  NeedApprovalData(
      {this.id,
      this.type,
      this.actions,
      this.logsId,
      this.body,
      this.isRead,
      this.isFinance,
      this.requestBenefitId,
      this.transactionId,
      this.requestReimbursementId,
      this.sender,
      this.requestReimbursement,
      this.claimBenefit,
      this.timeoff});

  NeedApprovalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actions = json['actions'];
    logsId = json['logs_id'];
    body =
        json['body'] != null ? NeedApprovalBody.fromJson(json['body']) : null;
    isRead = json['is_read'] ?? false;
    isFinance = json['isFinance'] ?? false;
    requestBenefitId = json['request_benefit_id'];
    requestReimbursementId = json['request_reimbursement_id'];
    transactionId = json['transaction_id'];
    sender = json['sender'] != null
        ? NeedApprovalSender.fromJson(json['sender'])
        : null;
    requestReimbursement = json['request_reimbursement'] != null
        ? RequestReimbursement.fromJson(json['request_reimbursement'])
        : null;
    claimBenefit = json['claim_benefit'] != null
        ? NeedApprovalClaimBenefit.fromJson(json['claim_benefit'])
        : null;
    timeoff = json['timeoff'] != null
        ? NeedApprovalTimeoff.fromJson(json['timeoff'])
        : null;
  }
}

class NeedApprovalBody {
  String? requestorFullName;
  String? requestorProfilePicture;
  String? requestorJobPosition;
  ApprovalFirstLine? approvalFirstLine;
  ApprovalSecondLine? approvalSecondLine;
  String? transactionId;
  String? requestDate;
  int? amount;
  String? reason;
  String? attachment;
  List<NeedApprovalProfilePictureJson>? attachments;
  String? requestId;
  String? reimbursementType;
  String? claimBenefitType;

  NeedApprovalBody(
      {this.requestorFullName,
      this.requestorProfilePicture,
      this.requestorJobPosition,
      this.approvalFirstLine,
      this.approvalSecondLine,
      this.transactionId,
      this.requestDate,
      this.amount,
      this.reason,
      this.attachments,
      this.requestId,
      this.reimbursementType,
      this.claimBenefitType});

  NeedApprovalBody.fromJson(Map<String, dynamic> json) {
    requestorFullName = json['requestor_full_name'];
    requestorProfilePicture = json['requestor_profile_picture'];
    requestorJobPosition = json['requestor_job_position'];
    approvalFirstLine = json['approver_first_line_by'] != null
        ? ApprovalFirstLine.fromJson(json['approver_first_line_by'])
        : null;
    approvalSecondLine = json['approver_second_line_by'] != null
        ? ApprovalSecondLine.fromJson(json['approver_second_line_by'])
        : null;
    transactionId = json['transaction_id'];
    requestDate = json['request_date'];
    amount = json['amount'];
    reason = json['reason'];
    attachment = json['attachment'];
    if (json['attachments'] != null) {
      attachments = <NeedApprovalProfilePictureJson>[];
      json['attachments'].forEach((v) {
        attachments!.add(NeedApprovalProfilePictureJson.fromJson(v));
      });
    }
    requestId = json['request_id'];
    reimbursementType = json['reimbursement_type'];
    claimBenefitType = json['claim_benefit_type'];
  }
}

class NeedApprovalSender {
  String? jobPositionName;
  String? approvalLastName;
  String? employeeFullName;
  String? approvalFirstName;
  NeedApprovalProfilePictureJson? profilePictureJson;
  String? customizedEmployeeId;

  NeedApprovalSender(
      {this.jobPositionName,
      this.approvalLastName,
      this.employeeFullName,
      this.approvalFirstName,
      this.profilePictureJson,
      this.customizedEmployeeId});

  NeedApprovalSender.fromJson(Map<String, dynamic> json) {
    jobPositionName = json['job_position_name'];
    approvalLastName = json['approval_last_name'];
    employeeFullName = json['employee_full_name'];
    approvalFirstName = json['approval_first_name'];
    profilePictureJson = json['profile_picture_json'] != null
        ? NeedApprovalProfilePictureJson.fromJson(json['profile_picture_json'])
        : null;
    customizedEmployeeId = json['customized_employee_id'];
  }
}

class NeedApprovalProfilePictureJson {
  String? link;
  String? type;
  String? originalname;

  NeedApprovalProfilePictureJson({this.link, this.type, this.originalname});

  NeedApprovalProfilePictureJson.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    type = json['type'];
    originalname = json['originalname'];
  }
}

class RequestReimbursement {
  String? id;
  int? amount;
  String? reason;
  String? createdAt;
  String? updatedAt;
  List<NeedApprovalProfilePictureJson>? attachments;
  String? requestDate;
  String? requestStatus;
  String? transactionId;
  ApprovalFirstLine? approvalFirstLine;
  ApprovalSecondLine? approvalSecondLine;
  String? approvalFirstLineAt;
  String? approvalSecondLineAt;
  Map<String, dynamic>? approvalFirstLineMessage;
  Map<String, dynamic>? approvalSecondLineMessage;
  List<String>? statusHistory;

  RequestReimbursement(
      {this.id,
      this.amount,
      this.reason,
      this.createdAt,
      this.updatedAt,
      this.attachments,
      this.requestDate,
      this.requestStatus,
      this.transactionId,
      this.approvalFirstLine,
      this.approvalSecondLine,
      this.approvalFirstLineAt,
      this.approvalSecondLineAt,
      this.approvalFirstLineMessage,
      this.approvalSecondLineMessage,
      this.statusHistory});

  RequestReimbursement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['attachments'] != null) {
      attachments = <NeedApprovalProfilePictureJson>[];
      json['attachments'].forEach((v) {
        attachments!.add(NeedApprovalProfilePictureJson.fromJson(v));
      });
    }
    requestDate = json['request_date'];
    requestStatus = json['request_status'];
    transactionId = json['transaction_id'];
    approvalFirstLine = json['approval_first_line'] != null
        ? ApprovalFirstLine.fromJson(json['approval_first_line'])
        : null;
    approvalSecondLine = json['approval_second_line'] != null
        ? ApprovalSecondLine.fromJson(json['approval_second_line'])
        : null;
    approvalFirstLineAt = json['approval_first_line_at'];
    approvalSecondLineAt = json['approval_second_line_at'];
    approvalFirstLineMessage =
        _handleApprovalMessage(json['approval_first_line_message']);
    approvalSecondLineMessage =
        _handleApprovalMessage(json['approval_second_line_message']);
    statusHistory = json['statusHistory'].cast<String>();
  }
}

class ApprovalFirstLine {
  String? jobPositionName;
  String? employeeFullName;
  String? profilePictureJson;
  String? customizedEmployeeId;
  String? reason;
  String? whatsapp;
  String? teamLink;
  String? jobPosition;

  ApprovalFirstLine(
      {this.jobPositionName,
      this.employeeFullName,
      this.profilePictureJson,
      this.customizedEmployeeId,
      this.reason,
      this.whatsapp,
      this.teamLink,
      this.jobPosition});

  ApprovalFirstLine.fromJson(Map<String, dynamic> json) {
    jobPositionName = json['approval_job_position'];
    employeeFullName = json['approval_full_name'];
    profilePictureJson = json['approver_profile_picture'].toString();
    customizedEmployeeId = json['customized_employee_id'];
    reason = json['reason'];
    whatsapp = json['approval_whatsapp'];
    teamLink = json['approval_team_link'];
    jobPosition = json['approval_job_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_position_name'] = jobPositionName;
    data['employee_full_name'] = employeeFullName;
    data['profile_picture_json'] = profilePictureJson;
    data['customized_employee_id'] = customizedEmployeeId;
    data['reason'] = reason;
    data['whatsapp'] = whatsapp;
    data['team_link'] = teamLink;
    data['job_position'] = jobPosition;
    return data;
  }
}

class ApprovalSecondLine {
  String? jobPositionName;
  String? employeeFullName;
  NeedApprovalProfilePictureJson? profilePictureJson;
  String? customizedEmployeeId;
  String? reason;
  String? whatsapp;
  String? teamLink;
  String? jobPosition;

  ApprovalSecondLine(
      {this.jobPositionName,
      this.employeeFullName,
      this.profilePictureJson,
      this.customizedEmployeeId,
      this.reason,
      this.whatsapp,
      this.teamLink,
      this.jobPosition});

  ApprovalSecondLine.fromJson(Map<String, dynamic> json) {
    jobPositionName = json['job_position_name'];
    employeeFullName = json['employee_full_name'];
    profilePictureJson = json['profile_picture_json'] != null
        ? NeedApprovalProfilePictureJson.fromJson(json['profile_picture_json'])
        : null;
    customizedEmployeeId = json['customized_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_position_name'] = jobPositionName;
    data['employee_full_name'] = employeeFullName;
    data['profile_picture_json'] = profilePictureJson;
    data['customized_employee_id'] = customizedEmployeeId;
    return data;
  }
}

class NeedApprovalClaimBenefit {
  String? id;
  int? amount;
  List<Map<String, dynamic>>? attachments;
  String? description;
  String? claimStatus;
  String? createdAt;
  String? requestDate;
  String? transactionId;
  ApprovalFirstLine? approvalFirstLine;
  ApprovalSecondLine? approvalSecondLine;
  String? approvalFirstLineAt;
  String? approvalSecondLineAt;
  String? approvalFirstLineMessage;
  String? approvalSecondLineMessage;
  List<String>? statusHistory;

  NeedApprovalClaimBenefit(
      {this.id,
      this.amount,
      this.attachments,
      this.description,
      this.claimStatus,
      this.createdAt,
      this.requestDate,
      this.transactionId,
      this.approvalFirstLine,
      this.approvalSecondLine,
      this.approvalFirstLineAt,
      this.approvalSecondLineAt,
      this.approvalFirstLineMessage,
      this.approvalSecondLineMessage,
      this.statusHistory});

  NeedApprovalClaimBenefit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    // attachments = json['attachments'];
    description = json['description'];
    claimStatus = json['claim_status'];
    createdAt = json['created_at'];
    requestDate = json['request_date'];
    transactionId = json['transaction_id'];
    approvalFirstLine = json['approval_first_line'] != null
        ? ApprovalFirstLine.fromJson(json['approval_first_line'])
        : null;
    approvalSecondLine = json['approval_second_line'] != null
        ? ApprovalSecondLine.fromJson(json['approval_second_line'])
        : null;
    approvalFirstLineAt = json['approval_first_line_at'];
    approvalSecondLineAt = json['approval_second_line_at'];
    approvalFirstLineMessage = json['approval_first_line_message'];
    approvalSecondLineMessage = json['approval_second_line_message'];
    // statusHistory = json['statusHistory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['attachments'] = attachments;
    data['description'] = description;
    data['claim_status'] = claimStatus;
    data['request_date'] = requestDate;
    data['transaction_id'] = transactionId;
    if (approvalFirstLine != null) {
      data['approval_first_line'] = approvalFirstLine!.toJson();
    }
    if (approvalSecondLine != null) {
      data['approval_second_line'] = approvalSecondLine!.toJson();
    }
    data['approval_first_line_at'] = approvalFirstLineAt;
    data['approval_second_line_at'] = approvalSecondLineAt;
    data['approval_first_line_message'] = approvalFirstLineMessage;
    data['approval_second_line_message'] = approvalSecondLineMessage;
    data['statusHistory'] = statusHistory;
    return data;
  }
}

class NeedApprovalTimeoff {
  String? id;
  double? duration;
  List<String>? arrStatus;
  String? attachment;
  NeedApprovalDelegation? delegation;
  String? description;
  String? timeoffEnd;
  String? createdAt;
  String? requestDate;
  String? timeoffType;
  String? timeoffStart;
  String? approvalMessage;

  NeedApprovalTimeoff(
      {this.id,
      this.duration,
      this.arrStatus,
      this.attachment,
      this.delegation,
      this.description,
      this.timeoffEnd,
      this.createdAt,
      this.requestDate,
      this.timeoffType,
      this.timeoffStart,
      this.approvalMessage});

  NeedApprovalTimeoff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'] != null ? json['duration'].toDouble() : 0.0;
    // arrStatus = json['arr_status'].cast<String>();
    attachment = json['attachment'];
    delegation = json['delegation'] != null
        ? NeedApprovalDelegation.fromJson(json['delegation'])
        : null;
    description = json['description'];
    timeoffEnd = json['timeoff_end'];
    createdAt = json['created_at'];
    requestDate = json['request_date'];
    timeoffType = json['timeoff_type'];
    timeoffStart = json['timeoff_start'];
    approvalMessage = json['approval_message'];
  }
}

class NeedApprovalDelegation {
  String? employeeId;
  String? employeeFullName;
  String? profilePictureJson;

  NeedApprovalDelegation(
      {this.employeeId, this.employeeFullName, this.profilePictureJson});

  NeedApprovalDelegation.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeFullName = json['employee_full_name'];
    profilePictureJson = _parseProfilePicture(json['profile_picture_json']);
  }
}

String? _parseProfilePicture(dynamic profilePicture) {
  if (profilePicture is String) {
    return profilePicture;
  } else if (profilePicture is Map<String, dynamic>) {
    return _mapToJsonString(profilePicture);
  }
  return null;
}

String _mapToJsonString(Map<String, dynamic> map) {
  return map.toString();
}

Map<String, dynamic>? _handleApprovalMessage(dynamic message) {
  if (message is Map<String, dynamic>) {
    return message;
  } else if (message is String) {
    return {'message': message};
  }
  return null;
}
