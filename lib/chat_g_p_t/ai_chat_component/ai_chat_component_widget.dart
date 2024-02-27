import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chat_g_p_t/chat_container/chat_container_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ai_chat_component_model.dart';
export 'ai_chat_component_model.dart';

class AiChatComponentWidget extends StatefulWidget {
  const AiChatComponentWidget({super.key});

  @override
  State<AiChatComponentWidget> createState() => _AiChatComponentWidgetState();
}

class _AiChatComponentWidgetState extends State<AiChatComponentWidget> {
  late AiChatComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiChatComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 770.0,
        ),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: 100.0,
                        height: 24.0,
                        decoration: const BoxDecoration(),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5.0,
                              sigmaY: 4.0,
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: wrapWithModel(
                                model: _model.chatContainerModel,
                                updateCallback: () => setState(() {}),
                                child: ChatContainerWidget(
                                  parameter1: _model.chatHistory,
                                  aiResponding: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            'bpa7rz67' /* Como puedo ayudarte? */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelLarge,
                          errorStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 70.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: 8,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.send_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          // Create a message
                          _model.apiMessageCreateResult =
                              await OpenAIChatGPTGroup.messageCall.call(
                            token: FFAppState().apikey,
                            threadId: _model.threadId,
                            content: _model.textController.text,
                          );
                          if ((_model.apiMessageCreateResult?.succeeded ??
                              true)) {
                            // Add Message to Chat History
                            setState(() {
                              _model.addToChatHistory(
                                  ContentStruct.maybeFromMap(getJsonField(
                                (_model.apiMessageCreateResult?.jsonBody ?? ''),
                                r'''$.content[0]''',
                              ))!);
                            });
                            // Clear TextField
                            setState(() {
                              _model.textController?.clear();
                            });
                            // Wait for UI to catchup
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            // Run the assistant
                            _model.apiAssistantRunResult =
                                await OpenAIChatGPTGroup.runCall.call(
                              threadId: _model.threadId,
                              token: FFAppState().apikey,
                              assistantId: FFAppState().assistantId,
                            );
                            if ((_model.apiAssistantRunResult?.succeeded ??
                                true)) {
                              // Store the runid
                              setState(() {
                                _model.runId = _model.runId;
                              });
                              while (_model.status != 'completed') {
                                _model.apiRetrieveRunResult =
                                    await OpenAIChatGPTGroup.retrieverunCall
                                        .call(
                                  threadId: _model.threadId,
                                  token: FFAppState().apikey,
                                  runId: _model.runId,
                                );
                                if ((_model.apiRetrieveRunResult?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.status = _model.status;
                                  });
                                  if (OpenAIChatGPTGroup.retrieverunCall.status(
                                        (_model.apiRetrieveRunResult
                                                ?.jsonBody ??
                                            ''),
                                      ) !=
                                      'completed') {
                                    // Delay 3 seconds before next check
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                  }
                                }
                              }
                              // Get latest message
                              _model.apiGetMessagesResult =
                                  await OpenAIChatGPTGroup.messagesCall.call(
                                threadId: _model.threadId,
                                token: 'apikey',
                              );
                              if ((_model.apiGetMessagesResult?.succeeded ??
                                  true)) {
                                // Add message to chat history
                                setState(() {
                                  _model.addToChatHistory(
                                      ContentStruct.maybeFromMap(
                                          OpenAIChatGPTGroup.messagesCall.data(
                                    (_model.apiGetMessagesResult?.jsonBody ??
                                        ''),
                                  ))!);
                                });
                                // Wait for UI to catchup
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                // Reset completed status
                                setState(() {
                                  _model.status = 'queued';
                                });
                              }
                            }
                          }

                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                width: 100.0,
                height: 60.0,
                decoration: const BoxDecoration(),
              ),
          ],
        ),
      ),
    );
  }
}
