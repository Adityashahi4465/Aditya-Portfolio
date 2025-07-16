import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/extensions/validators.dart';
import '../../../core/utils/responsive.dart';
import '../../../theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/contact_method_card.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/section_title.dart';
import '../controller/notification_controller.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _descNameController = TextEditingController();

  void sendContactEmail() async {
    if (_formKey.currentState!.validate()) {
      final res = await ref
          .read(notificationControllerProvider.notifier)
          .sendContactEmail(
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            email: _emailNameController.text.trim(),
            subject: _subjectNameController.text.trim(),
            description: _descNameController.text.trim(),
            context: context,
          );
      if (res) {
        _firstNameController.clear();
        _lastNameController.clear();
        _emailNameController.clear();
        _subjectNameController.clear();
        _descNameController.clear();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailNameController.dispose();
    _subjectNameController.dispose();
    _descNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLoading = ref.watch(notificationControllerProvider);
    return Container(
      color: AppColors.primaryLightDark,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayout.isLargeScreen(context)
              ? 12
              : ResponsiveLayout.isMediumScreen(context)
                  ? 68
                  : 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHeading(
              title: 'Let\'s Talk',
            ),
            const SizedBox(
              height: 80,
            ),
            ResponsiveLayout.isLargeScreen(context)
                ?
                // Mobile Layout
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width / 36,
                          vertical: 66,
                        ),
                        width: size.width * 0.34,
                        decoration: BoxDecoration(
                          color: AppColors.primaryLightDark,
                          border: Border.all(
                            color: AppColors.greyDark,
                            width: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyLight.withOpacity(0.02),
                              spreadRadius: 2,
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Get in Touch',
                                maxFontSize: 48,
                                minFontSize: 36,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.geologica(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      hint: 'First Name',
                                      controller: _firstNameController,
                                      maxLines: 1,
                                      maxLength: 25,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 26,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                        hint: 'Last Name',
                                        controller: _lastNameController,
                                        maxLines: 1,
                                        maxLength: 25,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailNameController,
                                maxLines: 1,
                                maxLength: 50,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a email';
                                  } else if (!value.isValidEmail()) {
                                    return 'Please provide a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Subject',
                                controller: _subjectNameController,
                                maxLines: 1,
                                maxLength: 150,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a subject';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Description...',
                                controller: _descNameController,
                                maxLines: 5,
                                maxLength: 1000,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a description';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 42,
                              ),
                              CustomButton(
                                onPressed: sendContactEmail,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Column(
                        children: [
                          ContactMethodCard(
                            contactDetail: 'aditykmcs@gmail.com',
                            contactType: 'Official Mail',
                            contactIcon: Icons.mail_outlined,
                            size: size,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          ContactMethodCard(
                            contactDetail: '+91 99*** ***59',
                            contactType: 'Official Phone',
                            contactIcon: Icons.phone_outlined,
                            size: size,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          ContactMethodCard(
                            contactDetail: 'Delhi NCR, India',
                            contactType: 'Official Location',
                            contactIcon: Icons.location_on_outlined,
                            size: size,
                          ),
                        ],
                      ),
                    ],
                  )
                : // Mobile Layout
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 48,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width / 36,
                          vertical: 66,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLightDark,
                          border: Border.all(
                            color: AppColors.greyDark,
                            width: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyLight.withOpacity(0.02),
                              spreadRadius: 2,
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Get in Touch',
                                maxFontSize: 48,
                                minFontSize: 36,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.geologica(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      hint: 'First Name',
                                      controller: _firstNameController,
                                      maxLines: 1,
                                      maxLength: 25,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 26,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      hint: 'Last Name',
                                      controller: _lastNameController,
                                      maxLines: 1,
                                      maxLength: 25,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailNameController,
                                maxLines: 1,
                                maxLength: 50,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a email';
                                  } else if (!value.isValidEmail()) {
                                    return 'Please provide a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Subject',
                                controller: _subjectNameController,
                                maxLines: 1,
                                maxLength: 150,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a subject';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              CustomTextField(
                                hint: 'Description...',
                                controller: _descNameController,
                                maxLines: 5,
                                maxLength: 1000,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a description';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 42,
                              ),
                              CustomButton(
                                onPressed: sendContactEmail,
                                isLoading: isLoading,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ContactMethodCard(
                            contactDetail: 'aditykmcs@gmail.com',
                            contactType: 'Official Mail',
                            contactIcon: Icons.mail_outlined,
                            size: size,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          ContactMethodCard(
                            contactDetail: '+91 99*** ***59',
                            contactType: 'Official Phone',
                            contactIcon: Icons.phone_outlined,
                            size: size,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          ContactMethodCard(
                            contactDetail: 'Delhi NCR, India',
                            contactType: 'Official Location',
                            contactIcon: Icons.location_on_outlined,
                            size: size,
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
