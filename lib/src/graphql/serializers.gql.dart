import 'package:botsta_botclient/src/graphql/login.data.gql.dart'
    show GLoginData, GLoginData_login;
import 'package:botsta_botclient/src/graphql/login.req.gql.dart' show GLoginReq;
import 'package:botsta_botclient/src/graphql/login.var.gql.dart'
    show GLoginVars;
import 'package:botsta_botclient/src/graphql/logout.data.gql.dart'
    show GLogoutData;
import 'package:botsta_botclient/src/graphql/logout.req.gql.dart'
    show GLogoutReq;
import 'package:botsta_botclient/src/graphql/logout.var.gql.dart'
    show GLogoutVars;
import 'package:botsta_botclient/src/graphql/message_subscription.data.gql.dart'
    show
        GMessageSubscriptionData,
        GMessageSubscriptionData_messageReceived,
        GMessageSubscriptionData_messageReceived_sender;
import 'package:botsta_botclient/src/graphql/message_subscription.req.gql.dart'
    show GMessageSubscriptionReq;
import 'package:botsta_botclient/src/graphql/message_subscription.var.gql.dart'
    show GMessageSubscriptionVars;
import 'package:botsta_botclient/src/graphql/post_message.data.gql.dart'
    show
        GPostMessageData,
        GPostMessageData_postMessage,
        GPostMessageData_postMessage_sender;
import 'package:botsta_botclient/src/graphql/post_message.req.gql.dart'
    show GPostMessageReq;
import 'package:botsta_botclient/src/graphql/post_message.var.gql.dart'
    show GPostMessageVars;
import 'package:botsta_botclient/src/graphql/refresh_token.data.gql.dart'
    show GRefreshTokenData, GRefreshTokenData_refreshToken;
import 'package:botsta_botclient/src/graphql/refresh_token.req.gql.dart'
    show GRefreshTokenReq;
import 'package:botsta_botclient/src/graphql/refresh_token.var.gql.dart'
    show GRefreshTokenVars;
import 'package:botsta_botclient/src/graphql/schema.schema.gql.dart'
    show GDateTimeOffset;
import 'package:botsta_botclient/src/graphql/whoami.data.gql.dart'
    show GWhoAmIData, GWhoAmIData_whoami;
import 'package:botsta_botclient/src/graphql/whoami.req.gql.dart'
    show GWhoAmIReq;
import 'package:botsta_botclient/src/graphql/whoami.var.gql.dart'
    show GWhoAmIVars;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDateTimeOffset,
  GLoginData,
  GLoginData_login,
  GLoginReq,
  GLoginVars,
  GLogoutData,
  GLogoutReq,
  GLogoutVars,
  GMessageSubscriptionData,
  GMessageSubscriptionData_messageReceived,
  GMessageSubscriptionData_messageReceived_sender,
  GMessageSubscriptionReq,
  GMessageSubscriptionVars,
  GPostMessageData,
  GPostMessageData_postMessage,
  GPostMessageData_postMessage_sender,
  GPostMessageReq,
  GPostMessageVars,
  GRefreshTokenData,
  GRefreshTokenData_refreshToken,
  GRefreshTokenReq,
  GRefreshTokenVars,
  GWhoAmIData,
  GWhoAmIData_whoami,
  GWhoAmIReq,
  GWhoAmIVars
])
final Serializers serializers = _serializersBuilder.build();
