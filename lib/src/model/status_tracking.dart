class StatusTrackingModel {
  int? code;
  DataTrackingModel? data;

  StatusTrackingModel({this.code, this.data});

  StatusTrackingModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data =
        json['data'] != null ? DataTrackingModel.fromJson(json['data']) : null;
  }

}

class DataTrackingModel {
  List<HistoriesTrackingModel>? histories;

  DataTrackingModel({this.histories});

  DataTrackingModel.fromJson(Map<String, dynamic> json) {
    if (json['histories'] != null) {
      histories = <HistoriesTrackingModel>[];
      json['histories'].forEach((v) {
        histories!.add(HistoriesTrackingModel.fromJson(v));
      });
    }
  }

  @override
  List<Object?> get props => [histories];
}

class HistoriesTrackingModel {
  String? message;
  String? createdAt;
  String? leadFullName;
  String? leadJobPositionName;
  String? leadProfilePicture;
  String? leadTeamLink;
  String? leadWhatsapp;
  String? reason;
  String? requestStatus;

  HistoriesTrackingModel(
      {this.message,
      this.createdAt,
      this.leadFullName,
      this.leadJobPositionName,
      this.leadProfilePicture,
      this.leadTeamLink,
      this.leadWhatsapp,
      this.reason,
      this.requestStatus});

  HistoriesTrackingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    createdAt = json['created_at'];
    leadFullName = json['full_name'] ?? json['approval_full_name'];
    leadJobPositionName =
        json['job_position_name'] ?? json['approval_job_position_name'];
    leadProfilePicture =
        json['profile_picture'] ?? json['approval_profile_picture'];
    leadTeamLink = json['team_link'] ?? json['approval_team_link'];
    leadWhatsapp = json['whatsapp'] ?? json['approval_whatsapp'];
    reason = json['reason'];
    requestStatus = json['request_status'];
  }

  @override
  List<Object?> get props => [
        message,
        createdAt,
        leadFullName,
        leadJobPositionName,
        leadProfilePicture,
        leadTeamLink,
        leadWhatsapp,
        reason,
        requestStatus
      ];
}
