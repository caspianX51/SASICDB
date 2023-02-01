-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2023 at 08:24 PM
-- Server version: 5.7.41-0ubuntu0.18.04.1
-- PHP Version: 7.1.33-51+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sasicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `sasic_api_key`
--

CREATE TABLE `sasic_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_attachment`
--

CREATE TABLE `sasic_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_attachment`
--

INSERT INTO `sasic_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL),
(13, 3, 'D', 3, NULL, 0, NULL),
(14, 4, 'D', 4, NULL, 0, NULL),
(15, 1, 'P', 3, NULL, 1, NULL),
(16, 1, 'P', 4, '1', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_canned_response`
--

CREATE TABLE `sasic_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_canned_response`
--

INSERT INTO `sasic_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_config`
--

CREATE TABLE `sasic_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_config`
--

INSERT INTO `sasic_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'alanosmarviraspam@gmail.com', '2023-01-26 20:38:29'),
(2, 'core', 'helpdesk_url', 'http://localhost/sasic/', '2023-01-26 20:38:29'),
(3, 'core', 'helpdesk_title', 'SASIC', '2023-01-26 20:38:29'),
(4, 'core', 'schema_signature', '4bd47d94b10bd8a6bab35c119dadf41f', '2023-01-26 20:38:29'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2023-01-26 20:38:28'),
(6, 'core', 'time_format', 'hh:mm a', '2023-01-26 20:38:28'),
(7, 'core', 'date_format', 'MM/dd/y', '2023-01-26 20:38:28'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2023-01-26 20:38:28'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2023-01-26 20:38:28'),
(10, 'core', 'default_priority_id', '2', '2023-01-26 20:38:28'),
(11, 'core', 'enable_daylight_saving', '', '2023-01-26 20:38:28'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2023-01-26 20:38:28'),
(13, 'core', 'isonline', '1', '2023-01-26 20:38:28'),
(14, 'core', 'staff_ip_binding', '', '2023-01-26 20:38:28'),
(15, 'core', 'staff_max_logins', '4', '2023-01-26 20:38:28'),
(16, 'core', 'staff_login_timeout', '2', '2023-01-26 20:38:28'),
(17, 'core', 'staff_session_timeout', '30', '2023-01-26 20:38:28'),
(18, 'core', 'passwd_reset_period', '', '2023-01-26 20:38:28'),
(19, 'core', 'client_max_logins', '4', '2023-01-26 20:38:28'),
(20, 'core', 'client_login_timeout', '2', '2023-01-26 20:38:28'),
(21, 'core', 'client_session_timeout', '30', '2023-01-26 20:38:28'),
(22, 'core', 'max_page_size', '25', '2023-01-26 20:38:28'),
(23, 'core', 'max_open_tickets', '0', '2023-02-01 20:06:51'),
(24, 'core', 'autolock_minutes', '3', '2023-01-26 20:38:28'),
(25, 'core', 'default_smtp_id', '0', '2023-02-01 19:38:04'),
(26, 'core', 'use_email_priority', '', '2023-01-26 20:38:28'),
(27, 'core', 'enable_kb', '', '2023-01-26 20:38:28'),
(28, 'core', 'enable_premade', '1', '2023-01-26 20:38:28'),
(29, 'core', 'enable_captcha', '', '2023-01-26 20:38:28'),
(30, 'core', 'enable_auto_cron', '', '2023-01-26 20:38:28'),
(31, 'core', 'enable_mail_polling', '', '2023-01-26 20:38:28'),
(32, 'core', 'send_sys_errors', '0', '2023-02-01 20:06:44'),
(33, 'core', 'send_sql_errors', '1', '2023-01-26 20:38:28'),
(34, 'core', 'send_login_errors', '1', '2023-01-26 20:38:28'),
(35, 'core', 'save_email_headers', '1', '2023-01-26 20:38:28'),
(36, 'core', 'strip_quoted_reply', '1', '2023-01-26 20:38:28'),
(37, 'core', 'ticket_autoresponder', '', '2023-01-26 20:38:28'),
(38, 'core', 'message_autoresponder', '', '2023-01-26 20:38:28'),
(39, 'core', 'ticket_notice_active', '1', '2023-01-26 20:38:28'),
(40, 'core', 'ticket_alert_active', '1', '2023-01-26 20:38:28'),
(41, 'core', 'ticket_alert_admin', '1', '2023-01-26 20:38:28'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2023-01-26 20:38:28'),
(43, 'core', 'ticket_alert_dept_members', '', '2023-01-26 20:38:28'),
(44, 'core', 'message_alert_active', '1', '2023-01-26 20:38:28'),
(45, 'core', 'message_alert_laststaff', '1', '2023-01-26 20:38:28'),
(46, 'core', 'message_alert_assigned', '1', '2023-01-26 20:38:28'),
(47, 'core', 'message_alert_dept_manager', '', '2023-01-26 20:38:28'),
(48, 'core', 'note_alert_active', '0', '2023-02-01 20:06:44'),
(49, 'core', 'note_alert_laststaff', '1', '2023-01-26 20:38:28'),
(50, 'core', 'note_alert_assigned', '1', '2023-01-26 20:38:28'),
(51, 'core', 'note_alert_dept_manager', '', '2023-01-26 20:38:28'),
(52, 'core', 'transfer_alert_active', '0', '2023-02-01 20:06:44'),
(53, 'core', 'transfer_alert_assigned', '', '2023-01-26 20:38:28'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2023-01-26 20:38:28'),
(55, 'core', 'transfer_alert_dept_members', '', '2023-01-26 20:38:28'),
(56, 'core', 'overdue_alert_active', '1', '2023-01-26 20:38:28'),
(57, 'core', 'overdue_alert_assigned', '1', '2023-01-26 20:38:28'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2023-01-26 20:38:28'),
(59, 'core', 'overdue_alert_dept_members', '', '2023-01-26 20:38:28'),
(60, 'core', 'assigned_alert_active', '1', '2023-01-26 20:38:28'),
(61, 'core', 'assigned_alert_staff', '1', '2023-01-26 20:38:28'),
(62, 'core', 'assigned_alert_team_lead', '', '2023-01-26 20:38:28'),
(63, 'core', 'assigned_alert_team_members', '', '2023-01-26 20:38:28'),
(64, 'core', 'auto_claim_tickets', '1', '2023-01-26 20:38:28'),
(65, 'core', 'auto_refer_closed', '1', '2023-01-26 20:38:28'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2023-01-26 20:38:28'),
(67, 'core', 'require_topic_to_close', '', '2023-01-26 20:38:28'),
(68, 'core', 'show_related_tickets', '0', '2023-02-01 20:06:51'),
(69, 'core', 'show_assigned_tickets', '1', '2023-01-26 20:38:28'),
(70, 'core', 'show_answered_tickets', '', '2023-01-26 20:38:28'),
(71, 'core', 'hide_staff_name', '', '2023-01-26 20:38:28'),
(72, 'core', 'disable_agent_collabs', '', '2023-01-26 20:38:28'),
(73, 'core', 'overlimit_notice_active', '', '2023-01-26 20:38:28'),
(74, 'core', 'email_attachments', '1', '2023-01-26 20:38:28'),
(75, 'core', 'ticket_number_format', '#####', '2023-02-01 20:06:50'),
(76, 'core', 'ticket_sequence_id', '1', '2023-02-01 20:06:50'),
(77, 'core', 'queue_bucket_counts', '', '2023-01-26 20:38:28'),
(78, 'core', 'allow_external_images', '1', '2023-01-26 20:38:28'),
(79, 'core', 'task_number_format', '#', '2023-01-26 20:38:28'),
(80, 'core', 'task_sequence_id', '2', '2023-01-26 20:38:28'),
(81, 'core', 'log_level', '2', '2023-01-26 20:38:28'),
(82, 'core', 'log_graceperiod', '12', '2023-01-26 20:38:28'),
(83, 'core', 'client_registration', 'closed', '2023-02-01 19:38:21'),
(84, 'core', 'default_ticket_queue', '1', '2023-01-26 20:38:28'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2023-01-26 20:38:28'),
(86, 'core', 'max_file_size', '33554432', '2023-01-26 20:38:28'),
(87, 'core', 'landing_page_id', '1', '2023-01-26 20:38:28'),
(88, 'core', 'thank-you_page_id', '2', '2023-01-26 20:38:28'),
(89, 'core', 'offline_page_id', '3', '2023-01-26 20:38:28'),
(90, 'core', 'system_language', 'es_MX', '2023-01-26 20:38:28'),
(91, 'mysqlsearch', 'reindex', '0', '2023-02-01 19:37:16'),
(92, 'core', 'default_email_id', '1', '2023-01-26 20:38:29'),
(93, 'core', 'alert_email_id', '2', '2023-01-26 20:38:29'),
(94, 'core', 'default_dept_id', '1', '2023-01-26 20:38:29'),
(95, 'core', 'default_sla_id', '1', '2023-01-26 20:38:29'),
(96, 'core', 'schedule_id', '1', '2023-01-26 20:38:29'),
(97, 'core', 'default_template_id', '1', '2023-01-26 20:38:29'),
(98, 'core', 'default_timezone', 'America/Mexico_City', '2023-02-01 19:44:32'),
(99, 'core', 'verify_email_addrs', '', '2023-02-01 19:38:04'),
(100, 'core', 'accept_unregistered_email', '1', '2023-02-01 19:38:04'),
(101, 'core', 'add_email_collabs', '1', '2023-02-01 19:38:04'),
(102, 'core', 'clients_only', '1', '2023-02-01 19:38:21'),
(103, 'core', 'client_verify_email', '1', '2023-02-01 19:38:21'),
(104, 'core', 'allow_auth_tokens', '1', '2023-02-01 19:38:22'),
(105, 'core', 'client_name_format', 'full', '2023-02-01 19:38:22'),
(106, 'core', 'client_avatar', 'gravatar.mm', '2023-02-01 19:38:22'),
(109, 'core', 'default_storage_bk', 'D', '2023-02-01 19:44:31'),
(110, 'core', 'force_https', '', '2023-02-01 19:44:32'),
(111, 'core', 'date_formats', '', '2023-02-01 19:44:32'),
(112, 'core', 'default_locale', 'es_419', '2023-02-01 19:44:32'),
(113, 'core', 'secondary_langs', '', '2023-02-01 19:44:32'),
(114, 'core', 'enable_avatars', '1', '2023-02-01 19:44:32'),
(115, 'core', 'enable_richtext', '1', '2023-02-01 19:44:32'),
(116, 'core', 'files_req_auth', '1', '2023-02-01 19:44:32'),
(117, 'core', 'allow_iframes', '', '2023-02-01 19:44:32'),
(118, 'core', 'acl', '', '2023-02-01 19:44:32'),
(119, 'core', 'acl_backend', '', '2023-02-01 19:44:32'),
(120, 'core', 'client_logo_id', '3', '2023-02-01 19:47:01'),
(121, 'core', 'staff_logo_id', '3', '2023-02-01 19:47:01'),
(122, 'core', 'staff_backdrop_id', '5', '2023-02-01 20:20:05'),
(123, 'core', 'message_autoresponder_collabs', '1', '2023-02-01 20:06:44'),
(124, 'core', 'ticket_alert_acct_manager', '', '2023-02-01 20:06:44'),
(125, 'core', 'message_alert_acct_manager', '', '2023-02-01 20:06:44'),
(126, 'core', 'default_help_topic', '0', '2023-02-01 20:06:50'),
(127, 'core', 'default_ticket_status_id', '1', '2023-02-01 20:06:50'),
(128, 'core', 'allow_client_updates', '', '2023-02-01 20:06:51'),
(129, 'core', 'ticket_lock', '2', '2023-02-01 20:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_content`
--

CREATE TABLE `sasic_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_content`
--

INSERT INTO `sasic_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', ' <figure style=\"width:276px;max-width:276px\"><img src=\"cid:pvh9fdxwqcp1knlhfrqlpo2vs1bdcakg\" data-image=\"pvh9fdxWqcp1knLhfrqLpO2VS1bDCAKg\" data-annotations=\"eyJ2ZXJzaW9uIjoiMi40LjYiLCJvYmplY3RzIjpbeyJ0eXBlIjoiZ3JvdXAiLCJ2ZXJzaW9uIjoiMi40LjYiLCJvcmlnaW5YIjoiY2VudGVyIiwib3JpZ2luWSI6ImNlbnRlciIsIm9iamVjdHMiOltdfV0sImJhY2tncm91bmQiOiJyZ2JhKDAsMCwwLDApIn0=\" data-orig-annotated-image-src=\"cid:sem5jrmpt5bzoxom9h109wvljbg8-lxo\" width=\"276\" height=\"128\" style=\"width:276px;max-width:276px;height:128px\" alt=\"image\" /></figure><h1 style=\"color:#A6244C\">Bienvenido al Sistema de Ayuda y Soporte en Informatica de la Contraloria del estado </h1> <h3>Inicia sesion con tu usuario y contraseña proporcionado por la Dirección de Informatica </h3> <p>Si no cuentas con usuario y contraseña comunicate con la Dirección de Informatica en la Ext. 176 </p> ', '<p>The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.</p>', '2023-01-26 12:38:28', '2023-02-01 19:57:05'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2023-01-26 12:38:28', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_department`
--

CREATE TABLE `sasic_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_department`
--

INSERT INTO `sasic_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_draft`
--

CREATE TABLE `sasic_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_draft`
--

INSERT INTO `sasic_draft` (`id`, `staff_id`, `namespace`, `body`, `extra`, `created`, `updated`) VALUES
(1, 2, 'ticket.client.dm70jgjfbl49', '<p>q2wrrtjyk.jhfdgasdbfdng</p>', NULL, '2023-02-01 19:40:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_email`
--

CREATE TABLE `sasic_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_folder` varchar(255) DEFAULT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth_creds` int(11) DEFAULT '0',
  `smtp_userid` varchar(255) NOT NULL,
  `smtp_userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `smtp_spoofing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_email`
--

INSERT INTO `sasic_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_folder`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_auth_creds`, `smtp_userid`, `smtp_userpass`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'sasicmichoacan@outlook.com', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(2, 0, 2, 1, 0, 'alerts@outlook.com', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(3, 0, 2, 1, 0, 'noreply@outlook.com', '', '', '', 0, '', 'POP', 'NONE', NULL, NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, '', '', 0, NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_email_account`
--

CREATE TABLE `sasic_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_email_template`
--

CREATE TABLE `sasic_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_email_template`
--

INSERT INTO `sasic_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /><div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{response} <br /><br /><div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /><div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /><br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /><div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{message} <br /><br /> %{response} <br /><br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /><br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /><div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /><br /> Thank you,<br /> Support Ticket System', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /><br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /><div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /><br /><hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /><br /><table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr><tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr></tbody></table><br /> %{message} <br /><br /><hr /><div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /><br /><table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} </td> </tr><tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr></tbody></table><br /> %{message} <br /><br /><hr /><div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /><br /><table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr><tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr></tbody></table><br /> %{note.message} <br /><br /><hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /><br /><em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /><br /><table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr><tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr></tbody></table><br /> %{comments} <br /><br /><hr /><div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /><br /> <blockquote>%{comments} </blockquote> <hr /><div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /><br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /><br /> Signed,<br /> %{ticket.dept.manager.name} <hr /><div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /><br /><table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr></tbody></table><br /> %{task.description} <br /><br /><hr /><div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /><br /><hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /><br /> %{message} <br /><br /><hr /><div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /><br /> %{comments} <br /><br /><hr /><div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /><br /> <blockquote>%{comments} </blockquote> <hr /><div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /><a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /><br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /><br /> Signed,<br /> %{task.dept.manager.name} <hr /><div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /><img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_email_template_group`
--

CREATE TABLE `sasic_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_email_template_group`
--

INSERT INTO `sasic_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'es_MX', 'Default osTicket templates', '2023-01-26 12:38:28', '2023-01-26 20:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_event`
--

CREATE TABLE `sasic_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_event`
--

INSERT INTO `sasic_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_faq`
--

CREATE TABLE `sasic_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_faq_category`
--

CREATE TABLE `sasic_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_faq_topic`
--

CREATE TABLE `sasic_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_file`
--

CREATE TABLE `sasic_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_file`
--

INSERT INTO `sasic_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2023-01-26 12:38:28'),
(2, 'T', 'D', 'text/plain', 24, 'Ca3q2MWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2023-01-26 12:38:28'),
(3, 'L', 'D', 'image/png', 31713, 'SEM5jrmpt5BzOxom9h109wVLjBg8-LXo', 'rmpt5BzOxom9h109EVEijr_L4FyUtwy7', 'Dirección de Informática.png', NULL, '2023-02-01 19:46:56'),
(4, 'T', 'D', 'image/png', 47541, 'pvh9fdxWqcp1knLhfrqLpO2VS1bDCAKg', 'dxWqcp1knLhfrqLp-JuqkeRKsqqk5wRt', 'DyhORpW9.png', NULL, '2023-02-01 19:56:53'),
(5, 'B', 'D', 'image/png', 44209, 'qkb-AzxqpzH2W1_IDwKe9Rf3JdgtfIM4', 'zxqpzH2W1_IDwKe9c54KosWMo1krVbwa', 'fondo.png', NULL, '2023-02-01 20:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_file_chunk`
--

CREATE TABLE `sasic_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_file_chunk`
--

INSERT INTO `sasic_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);
INSERT INTO `sasic_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(3, 0, 0x89504e470d0a1a0a0000000d49484452000003bb000001bb0806000000020582df000000097048597300002e2300002e230178a53f760000200049444154789cecbd3f6fdcc6debfcd1cdcbdad5f7fd33eca0bb06ec8bd15c05e95510ab9b5dcc86576710afb00012c0307885d04bb29ed26526b15914b2b0222f53122bd8038d6be8047f62bc883d1f9d0a1690e97e40cc9e1ee75018493d52e391c0ec9f9ccf7df177ffdf55704ed328a071b5114ed445174238aa25751141d8ca787bb5c060000000000003f20765b66140fae4751f467ce513f18d11b45d1ee787a781c609bafeb7fd3ff6de3348aa2f7fadbe9787af87ec6f7010000000000bc82d86d99513c3016ddc7338e7a6e44af84efbbb65a388a072b5114ad48ccaee9df6b9e767f26017c2c317cdae6b90100000000c06281d86d99926237cd8984ef816f0ba9c4ed5a6abbd272777c90f83dd6f9217e0100000000c00b88dd9691c0fcbdc651133767230a0feab65ac7df8aa268c3a3d5d617e72957eed3c0da0600000000003d02b1db01a378602cb5f71c8e9c88c249196ba8626eb7b48526706d98739c48f812f30b00000000009540ec7680c4e7a927b7e13389c2cfdc9c47f1c0b8260fa328faba2f7d6361cf64afc6cd190000000000ca82d8ed881ab1bb65d893c5f7bd4a1bddf2b0cf0f12e691626b13dea73e4f584bfdf75525bb8a3cb52342f40200000000405910bb1d318a07460cbe2bb0ee9ea90e6f9b9ca7b325fb2c1b942a5fb42611ec92100bd10b00000000008520763b64140f4c0ced4f9616dc97e04c626d9bc8949c644336d6e0e3b6c5632a1bf4460debef07c52cef34d43c0000000000e83188dd8e19c5837796a45146cc5d4f2caba378b02151e892d82ae195123fd5ceeaec1b59ba3714635cc5a26d2ce05b646f0600000000803488dd8e5112a95f2dad7892b55c3a88c2de643796cbf38eceb3ac457b349e1e4e1a6e1a0000000000f404c46e008ce2c1b1c58dd75877576ceec51285c3193573cf15dfbadbc37eb9aaf31b9614bd7be3e9e1560b4d030000000080c041ec068062577fb7b4a494804bb93927d6d0de8adc2c29d15b267bf5d9787ab852e27b000000000030c720760361140f760be271ff8f98d48f96ec4989bac1df84148f0c0000000000edf30ffa3c1886050d21e3701445c69d7b3c3ddc50a6ea2270650600000000587010bbe1b051d092e345eb0c1b4ae8354bfcd35f00000000000bceff2c7a07848062526d02eebc6c96e154dcee75d5ce0d3ef372592ab8309ba45ebd8f530600000000003710bb61302cc8a65ce4de9c24b7dad296ce586cb23bef8ce2c1b0cf49aa2a26a73242776d5e043e0000000000d48704551d2331f7ce525ae7643c3d5ccb7e58a3d6eeb9ac9d93be08c11ab576cfcc776d659a000000000060b1c0b2db3d930231f7896b73ca4dd996b5d9c635594687a37890b8370719d73a8a075b3ac759eeca697e5499252cba0000000000700996dd0e91f5f24f4b0b2eebebea3b4309409bab731dce5371bd9d9635caa9115c16730e5ba10a770000000000e80ec46e878ce2c1b1626bf37822f157c64dd9950fca607cb9352d7e955139d96ce75fc40759c47be3960d0000000000ed82d8ed0809be5f3d1ffd83acb5d76b8ac834278a25369b11bf4654be2f2b849538ebaada62b615fdeb2adef7e4b24c6c2e00000000005841ec76c4281ebcf3e8967ca204540789a553627aab467c6fa820720100000000a03488dd0e5012a69f1c8f9cc4dc4e8a04602ae6375b9aa80ff42e8b340000000000840162b76566941a2ac39e2cb807557fa844505b15331db74de28a5deb1c01000000000022c46efb8ce281b1b28e2b1ef84c09990e7c583825b8d794006bcd7396e73a2456ea63042e0000000000f8803abbed73b5e4114bb929d74182f9405be2ea9c64475e692103f489925e9d4ae012870b00000000005ec1b2db3225e2756bbb29fb24954d794dbb5d4909f5ab0582f84c999b23fd7b9afaf71dc2160000000000da00b1db0139f575bdba290300000000002c3a88dd8e48594eb1760200000000007806b10b000000000000730709aac08a12575dd7dfdf8fa787a7f4160000000000f4012cbbf00912b8439525ca96244a6ae0eee07a0d00000000002183d8858f8ce2c18e84ee9512bdf2a3442f09b50000000000203810bb6044ee55596c6f55ec0d530b7803f7660000000000088d7f7045161b6585ce96422a8b71733ed63e0000000000008201cbee02238beebb926ecb459858de352cbc0000000000100a88dd054542d758746f14f4409290cab09693b02afb5d042f000000000004016ecc8bcbc10ca16b12505d1f4f0fb7b4992ccda382ef1bebf0ae4434000000000040a720761710655d2e8ad1bd3f9e1e0eb39996c7d3c3491445ff272b6e1e463cef2e7aff020000000040f7e0c6bc608ce2817147feb5e0ac8dd02d14aca9a456b658df9184310000000000402720761708b9189f16c4dece14ba093344b3b1fcae8ca787ef16bdcf0100000000a01b70635e2c760a84ee5e59a11bfdd7a5f9b82086f70aeecc0000000000d02588dd054196d86f2d677b1645d1b06a4fc855f995e5cfb746f1a0f23e0100000000007c80d85d1c8a6268b7b2c9a82ab05590b06a87eccc0000000000d00588dd054016565b99a1272eb5712592b72c7fbe324364030000000000340209aae61c5956df5932279fab7eae33a378705c50cee8ff5c043500000000004055b0ecce3fc3821241368b6c1d8adc99b1ee020000000040ab2076e798513c3056dbc796337ca58cca5e5099219ba8bda50459000000000000ad80d89d6f760aceae894cc946ec9e5bfe56d416000000000000af2076e7145975ef59ceee475962bda2645536516bacbb3edda6010000000000ac2076e7179be8fcd0a495753c3ddcc5ba0b00000000005d83d89d43665875270e3575cb627391be8675170000000000da00b13b9f1459751bcf8c3c9e1e1e44517462f97313b1c20000000000009ff0b1ceee281eac44517495ee099732d99365d5fdd3f2e727e3e9612baec4cabefcabe5cf5f953c17c664e0f8cce80d00000000e0932f86ff7bc7080a136779839e0d1e63991d2a2e3697513cd8b5b8309bdf5e6fc185f923a3786084d0ad9c3f9d8ca787d6524412b9c63a7cadf9568223665cad8da787a774240000000084c43fe4d68ad0ed0757ccf51ac5835c6ba73eef3256f7b3635a3e9f557717a1db1fcc98c4ba0b00000000c1f10f8be50dc2c5888b154beb6cf1b0adc4ea6651ecae2d337351ec2e42b75f5c99b1780100000000d03a24a8ea279f596865d5b509c82eacba09b618e1af155f0c0000000000e01dc46eff38b1c4476ec9ea9b8735c6b7696ad6ddfd716eaf1e0000000000b4c2ff580e62dc5e49381316c6327b3c9e1edadc916d56ddbdf1f4f05dc76762da3ccef9fcde281eec64db379e1e0e47f1c08cbf0db23107c74ac1a20a000000004030d8c4ee6951b65c088b513cd82a88736da5d4d00c76d58e3c91b495d74659843bb348433e0519b60100000000820237e6f9c026684f02b0ea468a17b65aa46dd9a5010000000000ea82d8ed39ca821bb25537c12676afccc8cc0c00000000005019c46eff29b2ea0653ff54d6dd3dcb9f11bb0000000000e015c46e8f9155d7163fd97a5ddd12d884f915c51d0300000000007801b1db6f6c02f17c3c3d3c08edcc143f6cb3ee86e4720d00000000003d07b1db5346f1e0ba29dd63697dc8c2d19661f99a2cd5000000000000ce2076fb4b915537d8923d8a233eb1fc99d85d0000000000f00262b7bfd884611f6ad3dae289bf96c51a0000000000c009c46e0f5132a72b9696879898ea13144f7c6ef93389aa0000000000c019c46e3fd9b0b47a4f257efa804d9423760100000000c019c46ecf18c583abc6ddd7d2ea3eb830271425aa5a69bf390000000000304f2076fb87cdaa7baee44fbd4016e85796b662dd0500000000002710bbfdc3569e27b8baba25b0b59912440000000000e00462b77fd82cbb7d72614eb089dd1b64650600000000001710bb3d42b1ac7959983f8ca787a77d3b1fb932db6aee12b70b0000000000b5f99f26bb6e140fd6540ff62a97a834c7e3e9e18ee5cb366b676f627573306dbf95f3f98acdf23b8a071b057586219f894a3e01000000002c048d895d09dd5f194695b9358a079145f0daac9dbdb3eaa63062f771cee7b971bb12ba3fb7d5b839c28cab6f10bc00000000b0283469d9b5c596c26c8cd5324fec366ed95569a33509ebeba963be97a8bedcc6d3c3779e0e5955a863d1adcfb0a789cc600118c6ebab51146d465164febdad33be88a2e84d1445475114ed4fa6afdf321660d1e0de0000a84f93629798cbfae4c5e5460562f7bdcbc1140bbc25917ba3e0ab5fa77e732ee174ec622d3471bbc6929d03e307600118c6eb4b51143dd7643ecb9226f7667b3a8cd71f4da6af9f312e6011e0de000070a7d1985da8cd5e951fd6494ea56cc74359e0afd568a8f9cdb7661bc5830f12be138f89b26c82df16e30b003d4393f9dfa2285a2ed97233a95f9d4c5fdfe55ac33cc3bd0100e007c46e78ec5575d535aec7ca6c3cf37b12b7c31916dcaa18617acf6cb2f84e8cf8f5e8eafc1113cbacf3f8d6f7be01da6418afffd5f0e18e52fffd466e8fc6d5f14d402e8f2f2b4ce6133687f1fa43ac5830e7f4f6de9050ff43d6e7b23c984c5fbfe8b2dd00309f742176bf1a4f0ffb9c3db84b6c82764b023317250bdb92206d1a63f11d9b6d140f5e99fabf456ece6a5b1ee7b6df8ca7874362778b19c583a6851484cfed540bd3ff6d26a391c4f0e53699be7ed3f6d90ce3f5ed6cbb2af07018af13a70873c91cdc1b0f2b0add17085d00680a2cbbfde2381d379bc2583b8fd32ec472534eacb875dc947d60dafab5dc9c77257cd36dbcaacff3604104a05992783f33b93656df174a74d396f05d75f86d12afc80419e691dede1bc3787d5962b72c46943feaa2ad00b0182076fbc581aca6598c1bf1efa378f0a3acbf1b8e6eca27129b59c1996469ce13dc455c49c5f79ea532020f0b6273c91a0cd01e4b9aa01aabd09b962c2d752d57092e82002064fa7c6f5411ba91dc972f1a6a0b000062b74f9818d8513cd82b70477689637d2581795010fffb51fcaade6db2d9046b1e374a08f173eac102748699283f37b17fc6e23299bede6fa82155e3117dff1e20547a796f0ce37523d2b72bfcc43c5f8e4a7c0f00a03688ddfe31ac21306d9ca59249552a5f24317a294847f1604b6daa6af1b5b1e5693f00501f33617e398cd78f647df11d03785131ae2feff700f3485fef8d2a56dd372499038036f807bddc2f244a8d3bf1879a0d37bf33eeceff1c4f0f57c6d3c3ddaa42378bf661c4ee3f8df62d4a2e5582fb243003080a63adf94d49737ce21a1bdc7a522d8096e8ddbd21ab6e59f76b23c61f34dc2400804b10bb3d44499eaa0a5ee3a6fccd787a68ca140d1b2a0bf46e3c3d34b5764d72acaf2ad60bfe20a16b4b580500ddb124d7e6e71e5be0eabe88fb23cc2b7dbc379e56f8eeb32e32c003c062821b734f318257199727056ecd67ca765cabe6adb2251b516dfe3daeb20f59678f47f160988aedb5b9391b51bcd384000700af6cab86a68fa4322f14df5727beb0cdacd1006dd3ab7b435e1f6593621de1be0c006d82d8ed31723fde4a89d2159d8db1fc9eba884709e9d39488fe609252557531561b2fcb0ea99d2b6a6bd2ce6357376a0068954d33091fc6eb775c04aff9ed305ebf6b5ca42bfef42d2e9030cff4f0de281bab6b9e17771b6e0b00c0272076e70089c503cfe57a26196bf11589d6eb7577a876e6953402807e61ac382fa328bae3d26a638132a259fb2a9390c758acee52aa04e69dbedc1bcada5ed6024d992100681d6276c1c6d59ccfafd15b00206efb88e155e9912f4d199282c43a4946e89b0d6485060892d0ef0d853494b5eabe68b08c190080152cbb0000fde28d26bfb35892c5655996d8b23175553031bca684c80b979dc8daf34c5b92d9d570416c2e2c3281df1bdb25adce6f4b3eb30000bc83d80500e81717b2f8544256984d6d654b8494e1a9a9c5ebd3aa54e7fc001681c0ee8d37254319dee2be0c005d81d80500580034d93416d817c3787d59ee873e6ae75e9625728ddf05807ec1a21400f40162760100160c63859d4c5f3f9040f56191bd9d72af040000000802c42e00c08222cbcccd82e43755289ba806000000a01570630600586054d3d358787f714c627569dd9d77d7c661bcbeaa98e7dbeaaf2441cf85160dccf9effb8a6196cbf9aa128d25d6f3d54c62a0e4d8c9bf975b8871928a1dbf9d4a9c964ea496f036e571f0f1bcba185b7d6b6f5bc89323e98fe4b991f5ee48fa22f8715916dd8f9ba97b32fbcc3c4a9f2faede00dd83d8050058705282f78f92d9556d6c6bb2578a61bcfe57cde39884583363847dee5f22f7694172afa594088e92ecb975d0847a3b25a867b1943aee66aacdfb29f1dd99c0480984cd92e79316931ffb7b18af473a1faf0b0a21b6b7e97ba32aa90477b7d3636c06e9be4b8f4b2304f71bbe865efb4fe2fe6189e47e9fdc87c378fd6d922b81245d00dd80d82d60140f56a228da88a2c8fc7b3d8aa21ba96f7f88a2e854dbee787a781adc090000944482f7ae2cbc75d93493e2799bd40de3f58712ba4d1fa7ec84ba2c89603319b39fb53de1d602c1b6a7446809c982c26516700926a7d257097d6b6f1ba492d96d3a2e84a5494aa13dd582cc8b502da012f9cf2b08fc2ccb7a763c34f7e064fabaf6221800d403b19b61140f8ca81d4ae45e2bf8ea95288a6e69fb76140f4eccef10bd00d057cc847318afbf709cec6fca9231170ce3f5e79ec5cf6794b01abbb2949a703f6a5a6c49203c6dbadf1221a9c58807750553dfdadb062df6c9a616c94c5f3c0aa9aeb6eecb971997f5ba2c49dc2f2b392000b404625748e4ee445174afe62e8ce8fd7d140fee8fa787bbde1b089d222bffd5196d78379e1ebee34a41cf79e638c1bd3d2f627718afd7b5f25571576dc56a2c2ead54b2203f68c2ca3b8cd7376509f365052c831123bfc872f6689edbdb061df5891993bf6931a673eba784ee2f0df4c1b6042fa5da005a02b1fb5f216344ee634fbbfb69140f22046f3f91a85d93dbfa8ab62b654fc65cfb8c8bbb11bfc758fca12f98183a47ebee5c9420d264f779cd9fcf14911edc235d30c75c366eeb3e6326dbb082cfa0d2d8eb5b7bdb20803e792ab17da7ab7088d4bdd994d837d6fda7212e7400cc230b2d76256c7633b1b83e988ce2c12902277c46f1604de2764dd6791fa45ddc2f910836aeeec712bfc78bdef71034470e13de252314437247acc14593d6564da65db35fbbb22a4bda4d57c11bc8f9444a7a3493beb5b70dd4272f0311e0c9d8bcdbd173e4790b63c384141c91ad19a0791656ec8ee2c186846e69ab9d389f11cb1b699f07464c8fa787ef9d1a0a5e19c583ab8ac75ed3bf55afbf0b89007e3c8a07c6fa7b20f17bc0388190984c5fef0fe3f50b07cbc6aaa7dabd5db1ea294eef3302125a91aeef4b9389dbd18a16caf994150e7d6b6fa3043626131257ef3b2d0bde6c59a9267918ca18009867feb1885777140fb6a228fab9a4d0d98ba2e87e1445ff1c4f0fbf184f0faf9b7f3549b82f97d53cae494c430098c58d513cd895c5e627c566b72974b35c511b4c5b2e4cdbb40003100a2e93b03663fd9ac075b25b34397f1998a87071d74edc5e43389f8b32a2a86fed6d89a7818dc98424c6bced78eab6b8ad700900689085b3ec4ae8fe34e36b46c04ecc66b3b899cf47f1e09de2326deeaf5f8fe281c9d03c716f39542595597bab63615b06237cefc9e2bbabb147b22be892370ef1a40b3d81b35949958ccad54df4adae4d2294962ad4e3b561b2e13eac9a18c821815713cc7409ee5b7bdb406332943ec923598cb91b5ed3bc60fa9eeccc000db250625731bab384e79e4a0859dd4a15e7b95332c6733c8a0724286a115d1f2372bff674d424e15424b7e33cd6f4d9f5126eee451851feadca59bd92e825be17bac0c5ead477cbae7752e585ea622cedcf6c317eaa87bae9700c134358ba0eaf8ed75616e932147a22f4adbd6d90aaa11b3a663166d38457f4a0ad55998b847e0021b36896dda2185d2368b6c6d3c303db8f6529dcad91c8c8b8a8ae1197d92c8ac73d704c347596caa47c5a57684a70afa4b63a49d0be967780496cb5c1f881967189e16cd315b02fb808ad99256a9464ea99ea95d62999b224e15336436c13d96adf66ca36551102b3c463dfdadb063efb24f13648fa634956595f62eeb9123a7592a1b94196e720a11f40d02c8cd85579219be0304277adc8faea589ee8862cc1c39abf8772d411ba8d248a9248fe28941d1363dd521bd74a7c17c00b66f2358cd7ebee6a91c5ee679356d5b5ad3be9af547754d7ed4e4dc1bbaddaaf8582c2f17cb2ec6bcb15328ad74cdcb4372d63ab5004f5adbd6de0b14f5e68312637a3b7fa635b0b292ec23ad94fdb35782f748e9f644e4ef5dfb6870583be27f403089a8510bb121a36a159287465cd3df0509ee85bb9335b2dc7e04c59a17bae6bbadb967bb944f46e92b44c2ef55b12be65dc9e7d95450200378e72ac72aba90cce7922a6aeabe851d538dae86fc1fba846e2a9b282c2478ca799dc3f9865d192284c04e623d560ddce08b55956d2beb5b70d5cdd978db89d591a48fdf14cb5bb5d333e5772b5f7c01b9de367425ec2f76818afef2be99ccb021f611f000db22896dd6181256da340e8aec83a57c60a9724163a2d488065dc99afe38eda197bb2de76bee0a03167c6e55059983794a40a00c2c488c7c289b6ac3dcb99cf961d2c68b513d74ca6af5f2821535571b159247653b1c12e987eac756e8adbdc575f3f577f5bc563dfdadb068e633292d0bd594574eabb3787f1fa2f0ec75ed2b57c51f3f75530e738b3249716964cf2acdf1c8e75bb038b35c0c2b028a5876c56dd3d5b4ca6b236ff5e42e81a2be1fdf1f4f0ea787a68125b19c1fba3e5bb572847d428b67e4f08d2b2ae36cd8a0d9e756e00d00c179ad8cf74ef35d61e2332331fd7155a4736d7d00ad41105ab334abd74261cd3c8b276536ede45d6c5beb5b70d5cfbe4ae8375f56e26ceb92a6d25747a50f61c753de7317916c05c30f7625789826c8275c7f29bb2e589eeabeeee2702d6885e253acae36beaa93683fafda460e71359eb83426d2a1a6f273a370068970b59775cc4496db1ebe14ceb4ec08b0485ab45b06c02ac99183152c2cdbb6fed6d0317b1fbcce57e908074e95357a15e8637b6ace705b8885ddc98011a64112cbb3661b99757c7b484f0309892309f89dc0c5b057fdb551c31f867a360a1c12c7a1c87247853aef236ce0ac6304063a8544e5d5c2d92a1e034b19785b46e3f3a5bff242ceaeca728fed0453c96b69679a46fed6d14c73119f97021966b77ed67845cc29ba48e7075b95f17ba2e3940d32c42ccae4dd87ce6ce2a015a243c3ea806ef4c57641393398a074f2c199c137766448c674c3cb4acf9a796c44fa6ef0f8cc8ec3a763a35de6c9e07e74a9e468c3774818bb5611ec4ee858789bdcb2476a98549bd8ddc1842c7f6d4b19639d1b7f6b684cb98dcf7e05a9ff0c2a11cd76ac371cf9585abe91787ecf500d0208b60d9cdcd626b89dd3c98518777ad8cd04d1d63a7c0ad1677e6869038dcd035cbe39a2cbc9d59d74b08dd0fd4d6858e59746bc3be07ab9e4b1fbe54f65ad7cde77574c938db454c63dfdadb062ee3c167acb14bff365adacc6191631e1747007acfc2d4d9cdf0999babe2746de55d66d6e12d604b56c63c514376e68690657dad4050de285bbb56e5a7aea7be7b35e53160ae6d72fdccb1dee5b9c7e770ec52f719a0055c26c5f330e95be489abeddabb58fbbb48cad4b7f6868eb73e71b484362976e7ca6d1d00e65cec16c466becf7cefaa2d5995a82d3c8cf019c503b3ef71ce9f71676e1009de61410cf6ad513c30b5763f89af96b85dd3755999510737bd40f258bf3f97083e5006e84fc4af39e68cbacd43842e04808b0be83c4c187d4cecfb9a78c6d66ec46effa9bd88d5805bf751cde74c93f7158b1c0073c6bc5b76cbbaa96e15089a91abf0184f0f277259ceb31c5fba33875812671e306ee7a378101508de7ba378f05e8b1d5bda8a846819ae69fb3afaafb83dd3a2c6ae8e53544ff77e155779802618c6eb9b8b2e143cc526ce9b2bb88b50ea6201a46fed6d8379c8fcbbe8211600508145a9b33b0b5b591753f265e2e9184589af7c1d03729851fbd8f0ad2c51630f42378f1bdaf7858e65e347842e04c2b643332e02a823ea0ab17700000073c0bc8bdd99b1b0b2b8daacba45aecda5d131f2b23227e0c6dc30aa53bb177013f7a8a50b21a00cb62e2ecc08450000000882b916bb05eec769f7665b3d5c63d52db2c69642f19f45d63a673769288762736dd9b1bbe4241b370cd0210f1d0f8dd8fd9bbe9660b259e65d6aa3369a41d742dfda1b340df449ddfdcd4b1d6f00688145cdc67ce9aa2a21fab5e53b5eacba7251b69597d9f3e8260de5d8989109398f0ffa8d599478a72d4d92ad794589ad6cd73b8f332cfb100ac378fda1a355379ae3922d75e8eba4dc16afea723eab1df447dfdadb06759342450df4096217001a6711c4ee495e622895a5b1656b3ef761d59dc15941ac30348429f3a46b7f3a23cb729254eab8aae55d59c0d74a24bb3a57a66f4a4f41e70ce37533917dead80e1fb569e1bf0992be98b37e58edd94248dfdadb06defa4449f0eac23306004ab30809aa6c354fd70a5c987d5a5b6d42e90091d30deaf70d596cd398ff7f1245d13fc7d3c3156375afe3626e7ea3df1ad1fb4f25c7ca3bd6066300424042f7170f4d79c105fd84da89ba744d42c325f1988bb8a94bdfdadb06a1f4898b0709e58100a0348b20766d16da8d02ab9bcf3240b6e3af793c065444227645e2f6894afe5c1d4f0f77b275715d30fb3289a7ccbecd3152c75b21561b424016965f3c9424396aa00e67df719994bbba933781cbf92c0fe375972cdf75e85b7bdbc0b54f9cc7e5305e5f7214ceb83103406916c18dd926366d42f7cca7d829b0ece6d5dc8516d1752e159b2dd7e7eb992d4ac5f05e6e45eeef94158290d084f3a187845409cfb8c09f625cba87f1fadb9ab189dba1f5a9cee78d439dd3a7c378ddababbbb180db4a5df5adbd6de0a34fa228bae9d8d4878e8b6b2caa0140697a2b76955c2a7143366ea3b9d658236846f1e0ac4242a24ff6338a073b292bac89dfac94b84a31a2e779f1a126b613eb5e98687c6de8dadb929845d9458b513c30ffbcd222cb81e785130067525695a71eacb9095875ed1cd5ac5b7c69599c4c5f87e61a7ee42094cc787b1945d11d1f0d91e5d508d22f0b0469dfdadb062e7db23a8cd79f4ea6af1fd5ec834dc705b623f2020040157ae9c6ac0440a7aa5d6bb69f47f1e04002258f2a16b58f963909ddc71234667baccfaa62b3f6d9126441478ce2c1d6281e98ebf5a759ab9821746d7caddfc88ea8200000200049444154fe69f665f6c9f5842e3102d74c3287f1faf3288afe88a2e8b947a16b269e0fb8c0565cc4ead3264ae018ebe2305effa5e6be5dc5f76d1dbbf6f833ed36fb488de32297d8beb5b70d5cfbe4a132b757422ed0cf1d8f4dd23000a8445f2dbbc39cf22e46607c3d8a077bc6353563513b90f89849c60d352f5bb211bcef2b960c32c2fc5ecee788dd40d002cac18c0ccd75b85c28d122c906967cf0c072c989e672666b8a6793e96b62e82c1897550757e64bcbe2305ebfeba38f256e1fa62ccd2fabbaa49a760ce37597f235917efbdb305e7f56c572ada45ddb3996f2db3601d7b7f6b681a73e79aaf37b30cbd2aa85826d0fd9de2f10bb005095be8a5d9b053792a8bc378a0727b2e81ec895f955092bdd49c9e38f15c3b955329bae4de02076c3a109a19be69a8e51347601cab0ec61d2e88b1793e96b627567f3ccc1a2b52aa1f5a8ae4bb32c6a9b39a2abae4bea330f09b4cc387eae859b7db9d6be4d8b7a89a965f5c166c18281f15a582a105d7d6b6f1bf8e8934d59be93fe7893f48704eeaa8e51d4175578860b330054a5af62f7b84482a7c4f5f827c5ec9611a5d9f8ca038b453692703622da08eadd228b9db1162b9633af8dd0315ab86852e8265c33c76aa18633401b982437b5e2f616907dc718e9a594d07aa17ac6564baf84c6edd45624348c4baa1129a52d66263edb83653061399d286d18afd7ddcf668175b757ed6d038f7db294b65e3bf4c72c2e286d060075e8abd89d28715059b15836395556ec0e657db5fddeb8527f6b3625a17a97139f7bbdc89a4792aa2028b31072a66bfb2ec752bfa26bbc5662ac91b00ae6012374ef6065298732e03ef210af9858f58d0be985a58ccc6a0d51fd5c82b78aabb4399fdf2a1ea74966255cea5b7bdb20b43e29e211cf1b00a8432fc5ae5c87d746f160a8d231d9f85d6fc791d5efb88488b9a6adaab576a5c0cd195ac02c36c8ed3d7bedceb5b0322bab723aa95992c57998632d3e213b33cc0108dd1a18176465a2f5553f77c9f3be4c6c70e9ebaa58e44701b9d46f16254aeb5b7bdb20c03eb1711460567200e809bdccc69ca02451465c3c89a2e84343c7782f8bdd5913fb276e371836348e4e543ae8abf1f4f0ba19635504aaf9ae7e63c6e5575114fda87d3ed13100facc3e42d789bb72c70c91d5aaa247f1daa1949c5ad2628295beb5b70dd42721277d7aabfb0600a016bdadb39b2031ba338a0713d5ddddaae0b65ce5182ba952443e59f3bc3fa841328e7cf69d627389cf8579e111c9a8dc903bb3a9d9fa8bc7d24f3ed936c9862ad64cbeabf309c12df77609e1d6b7f6b6c1835462ad90300b4377595c0300177a6dd94d63c48a2c6ac652fa7fb2a455b5c65e9d710c2386fe1945d19e9746ffb77d556a00b782eac2923c0b002259c26e2274fd605c478d753c500befa38a42379210b963891f6e9b996edd7d6b6f1b04d6270917f22209a94d00d043e646ec262866724d2ea3552dbc33adac7253ddd2aafca8a2a03e978bacf9dd3f8d30af58afb771546f36a836014027bc550d4d269c9e0950f026c2a2d682464a2c756da55c562de142fad6de36307d3299bebe1948c663737f7cc97307007cd07b37e60459235d2d9237ca664796dbeb44e23a4f54efa974d1fbe86f97d6a091d03d6e2ae11700f482b7aa67494298065172a09bcad0dca585ef858f4cb7fafd5d9547ea22e1d18516674a6594ee5b7bdb62327dfd6018afbf5569a52e5ced9f514f17007cd27bcbee281e6c8ce2814920f49327d7db61c5efdb124c19117cd5885c842e00044e52c3d2b82b7f89d06d0723748ce55c2560da9edc1fc99afbc0a7b09075f866cb89a05ec81258d952dbb7f6b641aa4fda7c0e24e391124300e095de5a7647f1e0aa2ca7be634bab66ccb51ddf7c7e4be59186210b5ef525421760b1384a36dc05bbc5888b61bc6e84c5760b1635739caa49a82a91b8690fe3f5db3a9fa62cd72f640574b28ef6adbd6da0361a2bef33f5c97643873d529f8492251b00e68c5e8a5d0f56c813fdbb92b38f2bc6257a3c3d9c99384aed98857171fe75140f4c099a1db93f07436842577dba22cbf88a92865dcfa9599be64ceee2ef55b3d86cefcab8a303cc2917996433c944d24c60dff461b2bd68c89a75e9c2398cd7b725b87c94a6b9482d6cecb769359380391ac6ebab3a974d65fd75615f63fb85ef73e95b7bdb20257a1f49f0def6b018f046e3f105cf2200689a2f86ff7be7af9c639c8ca7874e257146f1e0d862f5fccac5caa9d8dc9f6afcf41b23ead26253e58abecdf96ea9f3afd11693a06a2314119612baa513798da7875f783efe9ab6958632409f48fc1e67afff3c338a07bdbaaf01201f591b57b52da5fecdf2565b242171a1858da0acf61292aba952374b39256fd28b356f52e7d2baf5af6fed6d8361bcbe941a93cb992dcd45ba3f586c03802ee8956577140fd66a0add48f1b359a16313bbc6fdf8bac9bc3c639f652cbb698c75f2f7513cb85fc672dc0213df35896721cbed46cd6cd975b8a5edf23a8fe2c189dcdf0f4a5c5f00804e49ac8df3721524be7be336dfb7f6b6812cd473352e01607ee94d822a89a483195f3b51699f3c3e8bc595d8b1950e2a93a8aaaad84df849b1bc9d21abf6bd82e37ff0d53673edccf19448ecf7288a1eb72db25318e13b8ea2e84fd39e513cd851466d000000000098237a21764bc4e81a6136928be68ee53b36f74d5b4dd93289aa6c62f72bb92c17311ec5834eacbb72bfceb3687ffc8a5c7f5d8e71d508fa513c3895c0fd7646dc6d175c93f036c2f7d4f48b5cab0100000000a0e7042f76253e766708ddb5f1f4f052b42a1e36cf2a69124fe509d803cbf7af59be9fb4ebbaa54d672a3764fefec47a62ffe55edb82570b0745aee07b495fd6dcff759dd3852ca83e2db867b2de279bcd2a5f871bea1763edddc5da0b00000000d06ffa10b37b50209812a19bb5421e585c74b7b2aed0268e77140f4a7f3f85cdaafb310e743c3ddc91582fb2a21ac17bea2230cb924a4865e3d5787ab85573df2bb292bb26993a4b65544eb22acf8cadd5f19384574926e73a42fb8ac682b92e7bcaa04d6c2f0000000040cf085aec2aaeb4483ce509dda840ec7e6d049f255195edfbb6445536b19b6d4f190ba111c56d244c3a28b0909f49dc574656d0bae58bced4ae63976cbea971f0711f996ccf6b35c4af19131b1a030b91c51900000000605e0856ec96882bbd6f2be1339e1e1e8ce2c1b92546742b1ba76bf6338a07671631b4658903b6c50067055b19b17b45aeda4e65618a3089980a160e120b795d41b75551e8be4a65446e4c446adf0789755ea27c4df1d85f97dccd95bc31030000000000611364cc6e89b8d227254af7d8dc8f6d59906d62c666ed2c6bd92d6b4dbc2581ef1d956c7a5cb05f17a15b1613637bdfd4281c4f0f4dade1ddb6ada5c672aee36ea856e2a864dc2f49ab00000000007a467062b7445ca949a064cbb89cc6265eaf49fc65294a54f5c9f70b92539da7059ce53845ecf8ce069c4af065fd8acd425e8159eec73f9a4cd95d085c1ba61d264e7a3c3d5c91102f6256c92b0000000000088c102dbbb3e24a4bd5a79d5143f7330b6acae5b5ccf7cb5a756d62d7d6ae6b65cfaf02bb05257f9c322f2728d676afe02bdf3665b57645f58e8be2c27d2c06000000000040cb0425766724a43256d78d8a96419b90bb67292d53f4fdb4c5d555ec4e0aac898f7d95bd51e9245b6ceab94f61ad2cce4582f7a7a2524e5d20013e2e38b497c5000000000000689f60c4ae84505142aa8daad98a15d79be79a1ce5259d9205af8c35b86c722a9b703f9e2134cbb8691752c27db9eac2c14c24788b626077158fdd3972319f556f38486b340000000000cc2608b12b4be6acb8d2ba65696c96b90d4b7c6c994455332dbb0556cc73254a32dffdd1f29d7b35e27db34c0adcc19f34e89abb5620784d7b8ebb16bc3a7e511c6e69777900000000000893ce4b0f497016c5e9baba924e2c9988af48d064ada80716a1784322e97d99e45425adbf3b05657b76ea96229250ceab1b6c382999e0ab16a60f74fc7796f3ba220b6fa50cd005e2ff7d15e15ea226f0594bd9a90100000000a04142b0ec4e0acaf3385bd8245a6cb1a49fc5c7ce485435ac10af6bb3ec7edcb78e6513f2b71cacbb362bf98782524aded079ad15b890df90853737f3b4595430758147f1c0d44b7e378a077f4551f4ab65fbddfc5ddf33df1fda2cc7251656eac48503000000004080746ad95582209b05f2529879121e3b05c7d9c91180bb96ef6fc8b29b47da8579a52003f227eed8c6caaa7ec8fbbe6947a564554624161c7b5235eeb92ec6da2ab1febb651737747e1bd1df6edfc96613a3455cd3f6b5f6f741c2f6603c3d3c4895b4b22dac7c9045b795fe01000000008066e9ccb22b4158e49ebce52bae5402c666ddfd2c3e56f1c1e739dfbd5290442b2d626dd6d35716f16e732bbe56a5648facd4364bf85993eecb79e8fadd2ff8cad7a378602cbca64f7ed602431da19bc715edef6763f595f0b509dd48165d4a0c0100000000cc099d88dd54a6609bb0f9d158e33c1f76a7c0ad364f74578d134e0b259b40cd3d27658db62575aa2250770afab493844b3ab722c17bcba3c0b5716d462dddfb0e09d000000000002040bab2ec16c6e98ea787de8599acbb36016b924f658f59941d3acbc7e454b2c4dac45b9180b79df3b59cb67d862ce53657edbd2ec59c046f510dde2e19a97d0000000000304774217667c5e9da123bf96062714f36eca49355cd486c95a58c5577af28fe5862f4a4a06db9c99c52d884fc8710cae8a8666d5dc1fb417d637eff24b5ede9739bc57e16ae99be01000000002050ba48506513ba91e2741b4b10a4b23843c58766b9226b6e3a7ed796a82acba5d89575d5e62e5bc67ab8a38cc3796dcb2b9314457f97e5b11d77124a76612378d54745b1b391c4eb81e2a08fcb8c092d54ac692b93e46a4f021c0000000000e690104a0f253411a7fb193a86cd827a4bd98c2f29485495257111b65950cfcbb811eb3baf2c7f1e1658776d71bde76d27a52ac19a253ef9832cb5df8ca787578d1035eec565173fccf7f47df33bd34fdf1458929d4b5a010000000040d88422761b89d32d60abc0f5f5b1cae0249471733d9565b1a8bc51596cfd7025ef6f33acbaa109dd740dde3d5d8333b9255f9750f5b2e061f623cbed92f67f9e12d46bd4d20500000000986f3aadb32b2ac5e9caba3994607a2737dd4a25638c1550eecc3f59beb26b44a4f66bdc8fc705bb3b977b7451cc6c6901a7b6ed5984b3b1ee66dd928bacba41265e52fb2bb910cbfd39cfb2fdaec8faab63ed8428fc0100000000a0394210bb55e3740f52964cf3ef86114255637d8d109405f7eb9c3f1b2bea7122780bc46724abee5ac1dfebc4ccee58f6774596e64ba1d837ab6e15746dccf915c5415f328a07915cd3cde2c40165840000000000a06b37e6bd2a6eabb29e66854fae7b6f49b60aeadb5e9185f7ea8ce452a733322157cef62be16e8b37bd97ca1add3bab6e1146bc8fe281e9f3f74a22f6ed2ca19be296beffabf9bdf6b3d2e5f9000000000040777429762b250992a5ef5bcb9fd72c9f179272a7b5c5efde90abf4fb82445545d9855d322117596677e6c9aa6baeed281e9c2a13f5bd129994677145fbf97d140f8ed5570000000000b0407425763fc87db994109485aec85279a3441dda5c14975b143f7a45d9966d71c1796ed091c47129abae393f59353f5a2265dd7d62f9c9bd79b1ea4a88fe5ca21c515d6ec9da8be005000000005820ba12bb3b65934aa5dc886759fb6a8b19b952df2ff8ca9502516b63384bcc1b7764637934164859357f4f973e9258b6599de72556b7ad2cdcd4d405000000005820ba10bbafc6d3c32a71acbb25ad7e4e963b59438b046f155ecd8a4596a8fd3347b43e4e2cbc12cb55faaa8fb1ba652df2678a637e92da5e15c45cd73d0e0000000000cc015d64632e2dde541ea8ac45d5d94d55199aa382924465f85064ad943bed6486804f0bb389f657268eb57749a932d9b5d324259b0e4a2c1c5cd5f5dfd096d7575eeaf70200000000403f08a1f4502e128545f56db35cc6ed3a2484ba24257827351325e596529220db2948b295e6e339a46af83e2ef1bbca999fbbc658f9955d3ae917534268b78a855ad7fc2011b4a378b0a505821b4946ec3e66a7060000000080fa042976250ceb58e2d67c58f024784fb5af6b157e9a5b4a4999a4cbc41d27fbc8c63397b1eeeeb90afdae184f0f873e6377256c11b700000000000b4cd775766d1c1708bb93822cc5de32ee4a70ae282eb40c67e3e9e12749905209a87e2e21748d05f27e761f51f9d8ddde59750100000000009a2238b13b8a074509a9ce1593796cf9bbd7f23246648ea787e678df14d4d98d9424e993632b01d56941d6e43426f1d2f519aeb6459999cfca66b706000000000058048212bb8ab5bc57f0950d09509bd8ad5d6fb708b926db84e887a45dd1df35734f15633bcb9a6b04f457c69a3bcb0579c6dfb1ea020000000000a408266657e5768a44dbfd8cf5f2c46235f512b75b81cb84541513504572c59e948db355dc6f9e78fe40a6610000000000804f0942eca61252d92ca17b392ebec78188dd8d94d02d93ccca88f4610db7e3cf6279c5415f1353f5012dc25c55fcf62caf8177dadee3560e00000000d02da158768bb21e7f96f8491c5bcaf1788ddb8dfe2e8364139bf766b85e27180bec8e29b553e3f8570bea0d9375d813bace2b1a43d767d4422e44e5abce247ecd583d2d70bf070000000000cf742e7695c8c996c4e98312527d86110e121459bcd4db8d3e75ad2e9364aa88577277aedba6dc3e3031bf08a8fae8fa6e48dcba5ee33c6e68bb5ca8d0783d91f83dc0fa0b00000000d01c9d8a5dc5a1e65967134ce2a777057f6f2c6e77140f86724d2e531bd7c6b944aeab20ddb17c4eac6e4534e612815ba586b22f6e697b3c8a07e7ba86c779f5990100000000a03e9d895d59d58a5c70472544a2f7b85db90cef16b80d97654fb1b94e1666b9d6da441959984ba0b1b62591db85c0b5714d09cdbe4d09df5d2cbe0000000000ee7422765382d266357d5532b6d56bdcaeda75ec12ab99c653e2289b55f76486d57be15129aba1afebd93069e17ba64cddc4630300000000d4a42bcbeea440809c152483fa049f71bb1584ee89da7f2c516d13edf78c2bb48be09d11cf8c10ca41d771a8cdc5053dc15c6f730d136babcddb20596049b236bbc4009b31f8d3281e4c34d64a97a802000000007f0ce3f5d5288a36a32832ffded68e2fa2287a1345d1511445fb93e9ebb774799874217687052ec21f6a2472f215b7bb3b43e8266d4beff3406ec6c71661b55147946a9f450b02e758fd3e47eecab66b5186b32473b2b227577127fe4c04ab3d2ba90ccf552dcc57e4b930346302f76600807a68b2baa4c96a96b79ab85e4ca6afdfd0c50010fdf7b9619e19cf2574b32c49f89aede9305e7f3499be7e46c785471762b7281676abc684de396e57e2b2a85d274a96f5990837ed9505cee64e5d5a948ee2c17589dc59f1c236d7e645a7a856731e1f92ccc84a12e5d52d5c63f9e378d6f55d4b25c82adbd62b6ae3759fed030098573449dd4e4d464b318cd723596b2eb7c9f4f50b0609c0e2a167c86f51142d973c7923785727d3d777192e61114a9d5dc38f3533d2fa88db2d729b7e329e1ece1297079636941227a93abe65eaf59e61d5b55236f9d49e4affb49a0159627a3759004965862e73dd434aac0573c0305effabe6591c4da6afef3006ea43df37c7305e3713d38712ba75594d2cc0c378fded64fafa68fe7a0aa09861bcfe54f75259cc02d19dc9f4f5c59c74edcb0a4237617318af3fc4c21b16ff08a43526d9d2b0ce0f0b3236df50fc66196ca2b48cd03554b6081a2b9f89e91dc50363f9fbb5a4e089e4060ef97c98d12ff78ddbc9787a987547ef04d306d316b9c2dc9fd18659e70600b0d09849a62c312e4237cbbc4cdc014a935a34aac2837911bac3787dbb8a47488687ea3f0884102cbb1f64dd72a1917abb25856e54d0fe4fdc9e65c14ddc58eb64087ee5a166ef3c6316027e2a38bf9510ade2c63d5e63a308163900002c0ce3f5e79e45ee25c4f0c282f2b4e2693f9ab37b252fb6bf2c492c2f21108110826577cd43a6d95919726ba1d23585c87a6c2b936444ccce281e98acd17fc982fbb8a6d0fd80e0294642f6c7822f7d5be69ab68dda5464d9ff11d77500807c9a12ba008bc8305ebf6d49c864e3680edd76eb5a75135cc43278a66bb17bdf5386599b1bf14ac9dfdbda5068d955c2a1a2ecbff7246e5dcad07c6c0b7575672377f8bd822ffe1492e0555b8aacd17b755dfc0100e69d61bcbe89d005f04a15f765e3b63c8f09995cdd9071630e882edd98f73c5aab6ca2b4ac3834aecedfe67c7e4db5723fb3dc2ab990adc6ae6f4ef2da00f99838582d44d81619262656baeb523e2a4d5424744f14d30b0000195265419a02176658286ac4aa361aa72b2b731d5ccb885dc81dd9e5f710085d89dd335f2eb9b28cd932d59612d3260e76140f6c71bf976ec8893092c81d7ab2d696c1474cf322b221ab7b9ecbb859a038eeb2766daa26b08d33ae3b004021db8e13d25930618545a38a55f7d964fa7abfe1fef9a5e6ef4c067597ccf56f1c5d9959280b882ec4ee075bcdda9ad844f349c5644e3b8aa9cd6284d1efa378705633d6b6881325b19a557bd8575f2d0ca9a44fa796c590cbdab5467416f56faa36ee75b9c55fd5968c85335dc3f73ad6bb59357b15e75d5413f8dc532c3b00c03c5325ae10000a5036f3b2eeb76f8dd89de3fe3c7214bb942b0b882ec4ee96afd85389199b002d9b49f99219d6ddc893d03d93352fd9aecfb0eed5ad3d0c7f0bde8d82b8ea6b290befa5b09410dd90c05d2b51df363d2e3e2e5a8ce2c179ea3a1f64f67f5cb05fdf8b41000073874a7b349d04e62d23071601850454b1eade9da37aba79bc90e7489dd8db7db2b887451762d7e724de2668ab5a7513b6649df31587fb89b84d0b9812d6bddab587e16f8c9bb216456c82f7862cbc135dff222b7b15ae2941d93d25c57a25b7fa61c1c2c90759743b8d250600e801aed9522f64993213d38fa2563182cbda10bbb0283cac1012306f65863ec308f961bc7e5775bbab609e190fc239138802a9b35b8b1909886a25be3216e719c2a82ca3a2845225ac7be7c46bfa4382b7a806efad1662b0bf2e21a487085d008052b8643b3513d29b7996a9c9f435ee87b050c84ba2ac55771ecb0ce56204fd305e3771bf2f4b2e04bc59008b772f09a1ce6e5d6c56dd73972ccf121b6b129c75194ad07e464ae81659f77063f58cc6c4fd809b789f5aba0000a57171617ec68414e0234f4b76c5c5a2592db5f8f5a5b16617249d3a5256ea9b692f1108875e5a762518ef59feec5ca24796c015b9b56ed4b0fa7d160b9a627746fcef06d6bd66306252d735afcc5497fc88d005006887c9f4f50bba1ae0a3db7ed9446f0f1651cc6961ec5992902b550ec9b5bc11b4445fdd986db1ac1feaba306791489d24e279140f8c25f971855ddc505b3eba238fe2c1ee0c57d6fb35638da124260e7ac66249960fa9b8ebcb6ccbd9046b72a94fb2352789adcabac1ef119b0d005099ba965ddc9401fee6a26c891e5cfcff0bfdd03ffa2a76b72c9fef76e0fefba440047f3d8a07076aef6486c01a61dd6b87f1f4706b46ccf7b99287ed96b1b24bfcbe93204e1647d29e01b6d86c9384cc36960100c04e93f5750116022c93b008f44eec8ee2c1568178707661aec1b1324c8f2d3ffd5a42a8c8d2b75794d00a1a61232776da644c9ef8b0ae4b240f15bfbd9193e9f98c24640000000000cdd147cbaecd12f6ca57fddeaa18a12a4b9ecd723b4be862dd6b197900ac28fb7694e79eec0bd54a3e48b93b47b8ab0300000000344bafc4ee0cd7d34e2da3728d8d2ac4824608ddee29233a2588d72454932df12e3897e5fea32bb36d9f297767804a0ce3f555d5155d52ace2522666f16d663beab37b9a4a61acaabc4c920c6435e3ba7aa1ec98c9bf971b59769b47d76733758db2f1b347e9ebb2e8316e4a6893bd6fb3758293b13c17e339f5ccba9db97793f33bcad6386eb83de931bb9a295d953c3f937e3f72e9f7d4b19653f747fad9955ceba3aeee0f5d9fe5cc16e5bc5ba2549c7b72ed2efb0b17e86e18c6eb4bbaafd2636bd932a60d1fdf936d8eb590c658df2cbb45e5863ab7945514bc08dd405102ab0d6db3924d5dd3962cc23c1ec58324a9d5a54597325250074d98b65393a622b22f3af37bf3b23059675ff461c29c3adfdb25930f2da504c3c76ca2c3787d3f35915e68e13b8cd7ffaaf95333d9ff2c698d44dbc31ca196e593ebe2321687f1fa2f258e5785db25fbe551dd7aa29a8c6eaadd6533dda6c77c7a3c9bc9de7e93c2d0e738d104f769c1355b4a89e028c970db445ba2f2637639b3b076a1e7c8b32a7d3e8cd7b775ac59cfeb4f163c86f17a92edb7b1677566f1a1eafd94fe7e7a6cbed5b3d6f4fdbe43db1e56287f5496b2f779eeb8891a188b2ea41650364bbe1fd373828fd76f18af47c935f3fd4c09798cf546eca604481e3611dc05b3125125aca93411eeac8120cf811d8db3b2d994f3b8a2f85cb34d94a46ca72b377be817a902ffdb8e0d5fd604e2e9305e7f14aae8ad20a0ca924c08cc79373a815c1424de9e57106e5992b1f8d05c93ba22327452f7eea6c7045a8925f2a904d88b502de50d89965a68cc3ed45695253d7fb7cdb373d678d524ffb94386f0a5d4fdf1c065529f69577ac1a589846ecba97e7aabc501ca7a7944636bdbc37c204d2246cd332511bdb5ae5b5fc6d83f1a685853d804c80759d03a478988ca8a57630dfc75140f2612f2d0214a7cf6a7162a5c846e962bdae79f3a0680154d167ff3fc628b3491fa2d551fb073cc4b5c563bdf96bb846402f9872c2e50034db67e7310ba9f5d9361bcfe7c9eae8511563aa73f74ef369529da5c835fcc7da3eb120c3aff5084eeaa9e2b75846e96c2f1aa67cb6f0e42378d19372f5dee0fb3e062de23c378dd8cc5970d8fc73446943c1fc6ebbf853636fb48ea99d2c47c20cd6d5db73fcace0ffa38c6fa24766db5488370131dc503d3be9f6b08a56f4d1c2742a83bb4d8d046cc370b1b908b5e6cbf68b2d8d44b635913e5ce855f4ad4b721be97f4827c296b0f9424251a66b96556655be3bdf7c8b2f147c313d22cb7b578e543cc39a3674a9df3f7ee969d1ab33e059719af9f09799d77130b37b9c79b857ef387de23beefd9b2ac863436fb4847cf94647e5038eefa3ac67a2176e55e7ac3f2e7ae4bf65c1dc583dd82d243653002f9a7513c384e650786f658f16ccdb57145c702f888045853d6cd3c9e77257825ea5f7664014aac625dbda07b45ca75b9a90582db7526f42121cbcbcb0e6bfe3e9595a3b3459c940b6f0b70558a00002000494441541dbc8617343c661f4a8424c76a4ae8e61eaf87cc9d07471b04f04c09c6fbab04a5c7585f2cbb36abee99ea9976c96e8918ddfb5114fd58a28db7e4da7c2c810fed306b0c9debfa7d1345d1ff8da7875fa437f399fef6a3be5b44d7e31502222574db76fb6a7d12923ad72e2770c98a308277362e3188657918926b7d59529e1821b8c72763ba0bd7d18b505c9745d363f6f25c1d057e159e575cc8082d5eb696857a11d133a56997e532cc8a17efe518eb8bd8b5b9f8766dd58d6658043f481ced8ea78746b07f55420c4512bd26c673174b6ff3c80d3ebb1861aedd9eaedf7573fd4cbddcbcc515f399fe66be735de2774ffb48f323999921431742b7753a14f579247171b834db596e7151a257ee8e1d7862942171416cfbfe5a0da81fda18b3cb2d5874d32c55113fcaac1b5af2b2be5ba8db2294f763e1f8e9eb180b5eec2ae9934d50069198cac299c9b89c1647cabcbc52d2ca1bc962fc2beecdcd935a8c7862869da9a56b4a43d5f11c90f8dd523dde6fb4cfaf740c804bb41ab928893c5e0676ae6d5966fa4a9b96efdb3d4b6813ea7dbb54c312e88aeb38f159a7b5ad31db86c7439a8715afa9974cce9e697b5cf60ab9e286f04cb92859d7b67763ac0fa5876c56ddbd80ad6427267b745efbf4d95071be93547dd62212f7e67395c6a1766b036831c25b29285da383c01765a00352e576e61e259170b5febcd5c438791127b53a5d26089ba66df35a06a76718ebd583d09bacb11c7266ef6411e76e006d990925c14a91d46c2ee53e6acab2689c8614aa9194817a14405b82c221b95b139412b17d1c63418b5d65aefddaf2e7d60484e2676d357eb3fc58c682278be19a2cd71395229a85f9ce4fd46e05e83d0b11c7248b9dcbb91ea9ae5eaedb54aad07edd6318ab097578bb27f8b8dd540dddd0318b389bbe6ab54210dcae182bf9a2c43331bd80f8266bd5d3785fd602caa607cbe3b66a6cf3ac15eae390e60255dc937b35c642b7ecda04e6b989916cfae012b95b4a90352b5baf89cf34319bbb558ea1f33850e9a149c9acc049edd67ba37870a6df61ed05e8015ac9f5edb27494bc4cf4ffaba9974897b8bcc8cd4babd012a0f8a1672a8cff4b8d0c96581cc2c0c442ae9674a1eb0a9f597e93c95f527a67c973fcab71e93b4258cc0d55c7c5bee5d9fb467f3b9a75afe9d99ac4673e933079ee304693f8633c69fea689cce16f3325bdaa5caf2a62b757632c74b16b73616e54e8cadaba556055ce620467adf8ce04239265ad1dead8652cbd914a32a5adbd076d2c0400406d7cb92c9917c48b220b4ecaf2f9b0ed520672d5aefbd27a54c5bdd8bc5487f1fa9d9a82178bc36c2eb4927f94b6b2a7aef1b687f1b59a17c33999bebe93f7e561bcfe57cde31cd9f669c3712ca779a1459cdcfab28a39dbf670bff6415834bdb0f13635662f8fd5f0f3f042fdddc4f196aa2c0699f1358cd7f75309bb5ee85d51bbcf3566ef28beb4ee3b2c77f155cffadcb1dae67dde261e9f2991c46522303f7b8fe9b9723b6541cd733faeb438d6b73116acd89555d516cf5ac97a5af2781bb2241725c4b2b1e1c39d5896591393bb234bef4e05d19bb6f69e6b41603780d24c0020e4d6ebc3da5a4a0ca62c9ffb1d2489aaebf27954278e5682f7518dc453581c8a319397bb79024dc2f72835be5c62b8424e60e3eabefc567d38cbd271a1fbf58587ecac5dbbe81fe5588a56535e274db6cb8cc707d973f7e00962c35cd73b0d1f6fb9e202c17e22c06d8b2b75984c5f3f9050ab73af9395f96f7c2c7abfd1382ff35c4904f123652edece88ed3a19967b33c642b6ecda5c98bdd5d67514b8698c1bf29a4f3762b943efaa8dc39289ac128c40fed66ca378f0219524e9185767804ef1f1b2bf5975f5542fa29b8e2ba6a59145a3eeaa75ed44454a9c51c74d7c13b19bcbdbbc497c162d3498a448bf391ceb7688d7c0712c47eac39b15ad2617ba5f5d4a1c554a6ce49147b2f058cfd761225b86377942374d6abcfee2e97885f7888ef7400b4275a9d45ff2f8692a6efb59dd6cf6e6dadb72302c0a298bbf0be61eabf5ae4cc686eec3e71a5b95af499fc658c8a5876c2ecc4e565d63311ec50363393596d89f650d7511ba915c898f9550cb2baadf6aca0efdd352bb751689c5d79ceb85ca1899f35f6ba2bd005088eb0b6ee62aee0c1eb5e03e18399ce7918715e23a93fb554a63e452281ad2685cce635224d77bf6ae8375f56e26feae2a6d26feba90a89f19126026a26661aaa1763c2ad3df9a0cfb7816963dde7e4bcfde367011ab8b526eaf88ce846e1add03373586431b9b5ec75890965db930dfb0fcb9563caaf6b923e15797b382762582d7ab8537416ed25b12a889b5d7d696226e697bac7e312ecfa7da22fdfb5e356201c013726176b166ecbb4e10cda44c1606170b5c196a8b5d0fc7deafb9227c7b4ec55a5dded4b0c0ec3b5cfb50171b5c26a6cf1c63d82ee49a5fd722d896dbe885ac9b5d4f988f2a8ed97d47f1d5e6f18211898ad70ca025bdc5d553c45b42c5247422b48ef43dc642b5ec16b930578a8d9525d75883ffac29748d187c625ec4e3e9e18aacab361ab3f02618216d5c9cd596ff33a58e6a587bd35c5322aec7da8c05f8d70ab1c200500ed7c98a97179c26a48db936ca425af75c9d27cb7a79d7d94f48350343a08ef077b97ec1597c1cc772e4e33e9345b0b67557ae8a4de324ea3d527571c6b5cd6d1e6f5e3c4ff0a07113bba5bd6d1698cfc658a831bb36b15bc985d9b8eb962c1b942589739d64e383c7d343635d8d0a8473a316de4c5b4e757e438ff1c700d00c2e2ff9373e13406892d654ecae8b38586a69729e479031a31d5279623e87161f97b1bceff19e2d53d3d2c6aa278f091b171dc405dba8ba40e37a7dda3e9e37520b39cb9977d3b265e1cf75e12761a1dd981ddf6f75bc6d3a23a431169cd89555d4968ca9940bf3281eac48185771f3fda0dfcccc601c92e04db529a9d79bb839af217c0182c2e525e7d5bdd6588b1a14252e2f2b97042ee0118749d551cbb1a24de232967d5a3a6d352dcbd0b4c7c27e2896a6aa8b0bae8b336d1fcf05098f4ddd9bb7b1b07686532853c82716f2180bd1b2ebe4c2ac923d930a226faf4e6dda10056ff477f9a2ddc40a2e8bef9ab63a31be00d03d4db808ce9328f1018953fe06373977bcddb38e22a969b11b8aa5a96d37ea5e249b9225719bb23fc1e0e4e115e209f5618cf549ecce14a38acd2d1397fb418278d7a53e6ea882374d62f18dfe4ed26544ef8ab62ae58c00c00d27f7a506fabe2997babe5a0cb074fccdbc648d75a5f6024803ee867517a79a1ed7a18c95b61768825e1052799be72c6806c7dc88dd3e8db110c5ee9ae573abd895ebee7109cb65227227bec4671f046f8284fd2771cf12c0d7257ed389b5b648520510060db909362576b190c2bc300f0b208dde8f9e73098007546bfc290b7841e2b28016cc024bdfc6585062d708428bfbf1b92d8eb682d07d65ae8f8b25d7469f046f16f5c73bf5e147742d10bb00000090476f92e52c0a1221754aaf0194a28f632cb4d2433617e6e3bc0f4b0a5d63cdfd663c3ddc6842e82618c1db75592200000000583c10bad0347d1d63a189ddd22ecc2585ee9971cfad9a7caa2e085e006802c5c6f8a629f7c6beba3512a70ade68e09eadbb3fdc8c17008db7ba19bbcbf256d6fc2392d8d5c6a56676a7b5e0fb3cc68271639600b409d7ac8b6d19a1bb27f1d92a7d766906804671c97ebcdac0a415b1fb294cde204b48f72c62178a78e8217ef28dcadb240b7f1793e9ebdc45c061bcfe0bc9af6ae1723f36310fa8426fc7584831bb36abee498e289ccc10ba3f8ea787438f6dab048217003c73db678d3dadd076ba4a9cc764fafa8bd0da045093555ff7ec305e7729e9c122ce9ca3e7f9b6c3591ab1f1a8810ce2e0176fcf94aaf47d8c85e4c66c13bb59abeece8cf242f7bb14ba09255d9a5b71af0680207079c8fbae5fd7643dbcdaeec0c3789d4cce10122eaeed3eefb1d0ca964158b88e8f3b08ddd608e59952955e8fb190c4ee8ae5f36c72aa22d7e427e3e9e16ec1df5ba584e0bd358a07b6f30680f9c2c5fd684989217ce1735f595c5ee6b8c54148b88ce5e561bcee3c9e87f1fa92e3241737e6f9c7659c3d0aa9a4cd02e0fa4c69f2dd5d44afc758176ecc93513cc873ddb589be1db90447aa035b540e676d140f72333707ccc1281e349625da81dcebd1c3fe050805570bcbd361bcbeeffad218c6eb0f9b746136ed1bc6eb6f6b1ec3bcc89f35d02c80ca682cbf71886f37c95c6e3af6bc6b9c1c16bbf9a7eef8788b45b75d7c3c537ccc03d2188f2a5bdc6c8a5e8fb12ec4eeac7ab8596e35f4dd50b8d6b37ab67dec6380ce994c5fbf751081915e362f8d3b50dd7391a5a9e96c8a9126d87556a02f57ae27d3d72f1a6813401d8e1c26a6abc378fde964fafa519d1f2b56f7a1c3553bc26ab710d4b5bacdb3d53fe4901897678af33c208d2cc546407f39e359d1eb31165ae921008079c635b9c4ed61bcfe52ae8d9590d07dd952dfba88d5a74d945830abd726bb63d7e51ba077b82ebc3c9437452574bfbad6b3ec24990d8047ea2ed62c05fcac777da6dcd6bbacb6c787e91b653b7e2e01dd653c70e320760100dac387c5d2bc947e2b1b0f685e88c6ba1445d12f1eca0694422e517557742f57ae7d4d54f452372ff4dfb43add96e08739c078647870057e5a76914af7eb430ff7eb0562176650cbbaa871dc96907409ff69c38ba9329e9e29b7350fa8e441a5455ff33efc2363ad6d2a5f4610632ca4d2430000738d5c995d6a77269897c02f8afdb9ac59978e8b91505cd57136db12b9199e3958a656f5227f54d7a5598b019b39eed44eaea5b0903cf370cf6eca22b3af89ee1b4d7a93895dfa7ef531c97b860bf3c250370674a966d8c8d3104bd7e5b0691699cc2273e6fdb89adc6f93e9ebbb1db5cdc733c55c83e75a1c4b9e2b6f93e74af4f7b926f381a2678be9aba5826746afc718621700a05d7cbce4129297b679a9857619f7f5c2aa2bb497522f72f3a2dc4fbfc4b34830dc4e6d452f4ae35a6ac406962f988999287b5aa45ad2e2cbe5024c83f7ec85272f12e8076f1d62401f56497824ab609b19815d633e3725e43c35c70f1e9f2991de750f93f87e8773dd2c786ef47a8c7521764751149d76705ca8c6c4924cec2bfab117fcbae81d102a9e5f72219fa7c93af9c843dce1b244b37105bdb0b8b5add610d5cf257829cd0265782457f83e403999c5e28d43cce5b2bc681e1465cd4d25376c3bf1d33c3f9f437ba6145ddb5e8fb12ec4eee9787a48f99ac0b194878ab876fd2055ae0bc2a44f13e7da18d7256594f525ec973cefcbc451de4118c02c4c1cba166f828c034c714436f38563df715c66c362deca3b20899bdcec30bbb16bc9be6009f09962aef303cbdf7a3dc648500500d0324ae0b42831a3771d326a36cd6a0fc40b04c264fafa59e0499fdeea7e8305c253c2a328f53c7ca904692f3bb2e67ea4e91aad65133d36859e29a1d43a5ed2e2f467f47d8c217601003a20b0975c63c86a7a2760c1bbddf584077ac58340ad4de6feba8b97c2c2f26c8e4f7cde3d15ee06f44c297a17f6768c21760100baa3cb975c6b2f2e59b24315bc8f9ab61ec0fc905abc0949f05eb649f7192c207a86cdab289ceb4482813d53ac62b7cf630cb10b00d0111dbee41eb46d550e50f02602619e2d22d000e6be9d4c5fdf0c64e267eeab2f11baa0d09836c641ab359c25b29a3a5e1765f93e233517e85ad82fcfa871dfcb3186d80500e8900e5e720fba4a60a309f9cd00dcb75f482060d185da4ca6af1f68f2d7d502ce332dd8e0ba0c6d2d9e76b940dbc4380fa65eb016d1ee7698cf230985b066c0eeeb1843ec0200744ce625d7d4c4f5ad26c69d5aa3cc8b74327d7da7239170a43e788040001fc833a06d2b6f328e2931049fd0f0e269675e043dc8fde08dd433a5cdc5d8640178e6b8e9e31843ec020004424313e70b09cb9b21593275ae5fb6247a5f481cdcc19a0bbed102ce038de72645ef11e31866915a3c7de0a94eed85721bdcec72714502e8cb0549ecf8468bc2771a3edf44e4565a00eedb18eba2ce2e000058900bd18361bc6ec4e0b6eacfd571b57aab17d98b50ad3f6a9739cf67c3787d5bc931ea16ae4f73a109c265ac17d62f6883d4bdfb48f7ee6d0f75a1df681cbf28722f04c8222f9e177ab66ed728ef52f40ee924463cb12aea9c1e3aba21bff124d41a438b5a47c3787d55efc6baf38134fb3a77e7b9415fc6d817c3ffbdf357cee727e3e9e19acb8e47f1e0388aa25b397ffa6a3c3d3c76d937348fedfa8da7875fd0fde1338a07dcd773845e74b7f5925bd60b259d58e322f5e2beac87d7e784352a05b49a3acfecf926bc4d4d568e927e20590f84c2305e5f4a8de5e5cc9626b987d3f7f21b042ef84289876e67de2169717294fab717ef90d4bb31399fece2d2454a34bd49bd237a6b1dd639af165cc7a8abf30e758c61d90500081cbd101646c025abd9013405c009592b18cfd0395a3899abf2448bf66e8c023fe750c71862376046f160278aa2b296b8776651653c3d7cbf909d0500000000009002b11b2812ba8f2bb4ceb896ae680300000000005868c8c61c2ec31a2dbb318a07885d0000000000587810bbe172a566cbae2e42e70000000000001481d80d90513c7011ac5876010000000060e141ec86898b60c5b20b00000000000b0f62b75ffc68eadcaad6ed578bde190000000000003610bb6162b3ce96292b747dde3b070000000000601688dd3071716346ec0200000000c0c283d8ed17a7496bc7d3c3e345ef0c0000000000001b88dd30c18d190000000000c001c46e98b8b8315f9be78e010000000000280362b75f9c665a7bb2e81d020000000000900762374c72dd98c7d3c3326eccd1281ee0ca0c00000000000b0d62374c6e38b60ab10b00000000000b0d62b73f9ce7b4948ccc0000000000003920760363140f6c9998df556829965d0000000000586810bbe1e192893901b10b00000000000b0d62b73fe459767163060000000000c801b1db1f7063060000000000280962373cd63cb408b10b00000000000bcdff2c7a07f4883ccbeee92275c0281eac49c8e78979d33fefc6d3c3565cbb436a0b00000000007c0e62b73f7c2676c7d3c3f7a3789077027361d91dc50393ac6b4bd6ee52b587d51f2751141d986d3c3dace2fe5db45fd3a71bda6e5568cb59aa2d0bb5380100000000d02588ddf0f0e1c67cadaf27afd24b4389dcbae7714bdb78140f8cd89c486cbeafd1962d6da5c4760e37b43d1ec58373b565b76a5b0000000000a01a88ddfe60b3509e3908b16090e574278aa27b9edb64fae627233247f1c008cdc92ca1a9b66c49745ff1d81623dec712e17be67c7d599e0100000000e053e64aec4aa40ce5c66b2c79bb2d1dcf58008f9b3c5e8128ca156ec62ad907eb618322378b11ad8fcdf5b289de9455d9b7c8cdc39cef3d442f000000004033cc45366623522460fe8ca2e8db288abe36d63c7dd6c6f1ee793c5ea978d012ac78da4f638ce2c18e926c352d74d324a2f7dd281e6c259f8fe2c150d6f3c72d08dd34e6dc4fd5170000000000e089de5b762558261681f2ad11113e2d9cb38e27aba06fce0bf677ea5120b7823219efd688c93dd1f9becb64a25e9375bd74222b5dbf9f5282b76a1f1af7f16359d6d3599757e459b052619f5714d36b925f6d91c80a00000000c09dde8a5d65ea9d9410142b1931d2f4f19aa0c8c5d526e4af76d0ce99c882f9b8c24f5ea5b219dbcef5e3f5952bf286626ecb5cab2ad7f34422bd6a5b36e46d300b23d47f1fc58327e3e921965e0000000000077a277625207664459dabe3c9e2e98b1589c460909b77997efc90ca5a5c29965522d408d25d8ff1c0b5e26a73da5236e9d563c55c37e1250000000000b010f44aecce7021eefdf10a2872c3ee93cbeb2ca19b88dc991993cb2071ba256b721dd1eb2d7994f6b123c15f260956532ef100000000000b412fc46edb2ec41dbb2ce75124687be5c65c4063598933a277b7c4753d51ec6c136d792fd1bbab3156c6bd1900000000002a12b4d89d6797650bbedd98fb80b1e66e8ca787ce71d5b390785d93c5fe27cbd7bf194f0f1b77ff565b36e4ba7e1080f70000000000c05c116ce92109927715623c8b3216fb3edeb9ebf12a322f6ecc799cb62174d314d5436e43e8668e773c07d7100000000020388213bbc68578140f8e65792b63edfa51a55e6ab99cd638de13594dbdbbb81660154305b1ad7d7363060000000000f046306ecc355c884d5ce530a9493a8a076d1cef631c67d5e395c4a71b73d97ab300000000000073471062b762d6e30f12b9565754cfc73bd7f1ba2ce3332b33b169e3b596da020000000000103c9d8add1a598f7f54c6de5a65696a1cef89af32382e24d6eb02dee5895dd56aedb4ed0000000000005dd089d87575596ee9788d949e9981ef0cca667fad267f02000000000008812ec4ee4685522bce2ecb158fd7b5cb725e1b3f94f8ddbb806a02030000000000744e1762b7ac75d5c965b9c6f1827059cea18c35db668126233300000000002c24c164634ee1e4b25cf3785db82c7f82e2897db322ab360000000000c0421192d8f5e1b25c85465c9647f1e02fcfed2c6369b609f5c7a378f0d8737b00000000000082e71f8134d0b82c5f6f51e81a97e5958ecb0995c5c58d1900000000006021e9dab2bb902ecb000000000000d02c5d89dd265c968bdc7dbbceb2ec4219618e78070080e0f8eefb1f9e4651f430d5ae9bfff9f7bfde70a50000cac173d48d2edc98f71a7259b6edaf2997e5365cae3f94a9932b4bf5490bed01000028c577dfff703b33417bc4040d00a03c3c47dde942ecee3651de4762f6beacb886575114fd733c3df451be28ef78bb12d265eae0d6e12c8aa2b50a2ed71b3a6700008010789a6ac3fe7ffefdaf675c1500804af01c7524c4d243b591006d2bc99539de8ea905dcd6f18a90a0dff0b5bf513c3016e55b8d34160000e69aefbeffc1582256758ec60af1802b0e00501e9ea37e08251b33000000cc01df7dffc352caedeec24cd0fef3ef7f5d706d0100cac173d41f885d000000f0c9f3288a96b43fe2cb0000aac373d41373e5c60c000000ddf29f7fffeb2e970000a03e3c47fd81d80500e818b92b6d4651745bf139cba9161d69338929de8678adbefbfe8765b53f69fb6aeacf6fe48275791eac4e03844f5bf77489e3bcd5bfc13eff204c185b9080d80500e81025a078987257ca725bdbd3efbeffe185dc9972e376befbfe87bf1ccfc44c5cef94fd72aa24c2ed82af25138cdbfa8d995498f378e1781e17e909cb7ffefdaf1725dbecad8f3ceceb13fef3ef7f7d31eb3b1a2fe9ec9c8fea66e76caa9fb3fb2d735e05fbf276be258e55f67a5e6426cb477527cb6ddfb3b368ea9ece52e138ab122ce6f967c4f5b3fffcfb5f4715cf29dbc7a69d4e897e8ac678d3cf85269f8fb368f2f9e3f29cc8ecb7cbb19587977755ddfe69f3191a2ac4ec020074c477dffff05c2f219bd0cdb21d45d11fdf7dffc36a97d7cc58a2bffbfe87975114fd32634291c7b2cef9374d4aeab2a4639b3e79feddf73ffc7f7aa9cf3bdb99f3cbfebf6fbaeee7b6cfb70c9ff489eec9978ee3b953dabaa71d8f63beff8bfabaec33338fedefbeff61d3e1f77da0a9fb36c4fbf19240c6561e3c433b06b10b00d00112bad9978e59f9352bae8fb43dd3676996f452ee44f0eab87f68453c4be2daf828b5ede79c43a409b2390f5f2fde25add037315909024dd097336d596e5964b5d6cf819c6f5936359e7f91fb646f68eb9e2e719cfd9ce3e4598a373d2cfa3defdb7572c4f9be0df97e0c6c6ccd826768cbe0c60c00d0327ad164278436d7a2477a61a533335e58269b9ffdb6e29915ba206a02f04b8e25fa48ae81fb337ebb5d735539cf4d7359db76a63dc964a76c720f973e9af5dba799ffaf7aac2c366bd4a6ae812b4df6731d9a3edf59d8aed7925c20f3268cb765e1bc5bd5255278bd6767d1d63ded789c4d1d23dddfc9a2df9d9a31c3e6f7c60a78b3c66f67d1f673a1adfbb6ebfb3197c0c616cfd000f962f8bf77f2fccd4fc6d3c33597e68ee2c1711445b772fef4d5787a78dcd70e5b146cd76f3c3dac1d53318a078d8c358f6d713a3f87b6f4a6afb9affd9063d59d1943a315e05f34c9be99f7126e2a062a75fcdf7256892bc5ffc89af25c938bb7fff9f7bfbeccf94ee9f350bb9ee64cb8efe4898d26fba8c963a9dffe28f8caffab5a83b1a97ef671de4d9c6f8963566eb7ac989b16e17bb768a25df798be68eb9ef6789c6cec61a445bf9b456361465ca589d3ac2c365dae9beb356ff2f958b09f4e9f3f05fb086a6c85f4aeeae2191a2ab8310300b44fd645aa70421cfdf74577a155e3071d65347e9833a1785035d18549e4a3843a2fe4a6ed84e917259bc94e16e62d262f7b3ed924278dc66175d0cf9d9e6f594cb2198de7473956d6e75dc7d7cfa0ad7b3aef38376b1ce7598e257659fbafcbc3798edff578df867a3f863cb6b2c7e019da11885d0080f6f964025c3693ab5e965eb26a56412bc4d997fe2397b6e8a53f53e457206b9d095964d4213d31799373be6d4d5cdaeae750ceb7149a2cdfc908de25593c83a3ad7bda729cda0b76fa5d3693f2c38af1b7d9735c84f85dd7fb36b8fb31d0b155069ea12d83d87560140f26c65d54dbe9281eacf4f66400a0337a9050293ba138f251bac0a70b55ce04676ec46e4e92917df55d5a582cb761a16aa39f433adf2aa86fb2f177ab1e93b0f9a4ad7b3aef384e0b76fa7dd63a56c502f72893f320d845095fb8dcb701df8f218ead32c7e019da3288dd9a8ce2c1308aa26f53bfbe1145d16eaf4e0200ba226bc90df68523219e9dac2f548dbe00b0b9a3652de3f33271e9edf92af62e7b7f045512abad7bda721cd7644c09d9f66e975d34d4a43fbb28717b414a97d521b8fb31d4b115108bf6ce2804b19bc3281e5c1dc583eb33beb691f3d98d12fb9eb55fb0f7ddda281e6c8de2c14ece663e6f2dd155486d815e925d397e1af0cb349b78e74dcd2cb38d92e36a56ca353c74745ee909c98bc47aa6e447e9f3dc6cda1db3e97e0eed7c6bf22ce3cebc1c58ec6e5bf774de71bce41b507bb3fb2a5d4e45edc88aa3a7f35a92a5ee7d1bf0fd18ecd89a05cfd0f6a1f4500a2372659dfd3afaefff9f4551b4359e1e9e7ad8f724b1048fe2c1b911cb3ef63bcfc82d7c2b8aa2b5320b09ea5bf3cf49144507661b4f0fdff9e822b5654d8b1c79d9886d6d3163c86429dee57a438afdccaaf4926afb39c5cc3544e5645a1d915da19e97b20ad9f3caf6ff8b4c16d1cd862def4df77368e75b1933b1fceefb1fb2f7f8ed9c097457b4754f377d9cfdcc3156ab1cc3b86d6b11223de64cedd32fe7304b6dddfb36d4fb31e8b135039ea12d8365f7538689d01546604d5c779ae3f27cfe7d12d500001b6f494441544d620c3eefababb28e1a91fabbfaad94d04d61c4e8388aa23f154bbda5858caad7cdb46568f6a1b68ccb0add1437740ebf9b73d2b9556e0bcc175a39cebe80969428e58fc062fcb2938a5026ec1f517f65cb4604d7ce9aa45d2bdfe658e0b2e3a8b1b1d3523f0773be8e64db1d92c5b0ad7bbae9e3f8887d7c9013bffbd2b15d41e178df867a3ff6616c7d06cfd06ec0b2fb2979aea7b78c581a4f0f3fc6e3ca453557b0e86fef128ba284cd4ece57af196b21d6beff22f76ed34ff73cefda88cd9fcca285aceb93f1f4f07d89b66c69f1e38ac7b698458ec7661bc5833d73bebe2ccfd04b1e288144f625ba2cd1fb54abadfb65b3356799515ff2332c75fcb22e4e418848b97ddfd6967d59974e54e2a98f1a4113a3b47bfb67e764c6c677dfff7094125397494766d5772d8baf7e2e4308e7eb91ec3d5bca55b0a5f1d8d63dddf471b2fbabec8e292bfc5dd56a4db88cdff591b0ab2b7cdcb781df8fc18fad049ea1dd83d82dc744a2b58c0bebafd1dfaeca0712c536c15428ba1604633ddd6d40e466b922a13994e8cdc5585e1b10b97998f3bd27d18ba57701d124eb8eb280e62589480ad09b38b2cbfa957545af239fbce4bb70efab28002e72ca47f49559ee68e9cfd396c3cd3a2e7701f473abe7db24267ef0bbef7f481f21a4b8b8b6eee9468fa367a8f57815f663aed5a38cc5cd3c778f3aaa695e8906efdb90efc720c716cfd030c18df9536c22e84a0d17d66b725fb589b85758f52eb9d182d04d93885e1b8f5b10ba69eed570d38639417573efaa3e6751dcceb6627ac9165a8ce9c32f3b5a14f08a9286a42723560bbf2c03e9c95ed34947bcf773e0e70b738eacb8d9c9fecb1e66e12da2f47dcbfdd8383c435b04cb6e8af1f4f060140f4e6ac465d661d8c231e60d736d8cdbf73bfd9b6092475daf92c8ca0349e2295b5b565a1a47300728a6e6489940370b62688cb561f93ffffe57d9d5605fa51842e6ad260efb3533ca86da47d931306bd5fd452656cb77d211d77e9e4568e7db158b70cf86ca03898544e02ecbf3265ba6a84fd4bd6fb91ffdc333b42310bb9fb393b82237c81e56ddd2bc5286ece38258dbe3e43f52eee65b0d88cd13b5e5a0625b363289cf00724989de677af13cccc4df44aaf9672cc23327c59e62cedea65db824b6dbb69cde49fdf776c655cbf4cfa3ba6e6c01c7e5a5272e1725e2a9f63313978735262e8df57309ba38dfc6c8293554ea9e69693cb6754f377a1cdf255c52f1bbbfa43edeec41fc6e13f76de8f763a8638b676880e0c69c42e2c439fb72094cace6560bc7e92b1fa2287a1245d13fc7d34353a2a9485c7e82f99e4926369e1e1a2bef3fcdc282631f7cd03e4c5bd6b4efaa6dd9505b9e687f00859897b626575f5a2c3d0f5b7439cabee45baf176a1601924dd697f4646129f3c2ee3d65928ce4f4d19b4c5295a5aa59bdbbeae7aeceb76142aefbdcd63dddf4716a2d2814a1b19f577f37a43ac99fe0fbbeedc9fd18e4d8e2191a260b65d94d89d92446f463465cfded54b1b6b3389105ef3493646a45db4689b8cf9f4c1dd624cb732631d2a2d6e1fda0eb3333637219643ddf52e9a7498dd8e01f353e7cb56547c9b1862d25c1829ea31560530bf24dc6da106915b70d97c7379938209ff5062b23ebcbb34c321923fef7fb904ca624d924230f6bc66b6f9699f4e4d1723f777ebe0d902d351452dde7b6eee9a68fd348f919d5dfbd9d69bb89dfbd197afd5d4ff76d1feec7e0c716cfd0705834cb6e56f0dc532dd61d89d722a19b581b9764e1db91c5f138b5199166ca1419e1fc8d4471113fa56acaa6132399761c2f583d56b3f0705dfdea354bb52cac5bb2aeceba2691be632cb9c386dab2a3451157ab332c08166b435b753bb32bda7999a35b4556efec64e179d7edf2414e9211176ebb7800b4d1cf219daf2f94d4287b9f842476dbbaa7b363c7f771b2fbf32920ee66ac72cb39f55183c4e5beedd1fdd88bb1c533340c164dece6d5d18d24348b121b55166212c2e678f767b8ae3eb688ec2b1244f3449ed03456ecafb448d0682926635dd535f9c6724dcc67df6831a3d1986ab5c508f0afd40759ca8872582cb2abd66db9d5658fbb1c88ab5356fcafce49b66adf7debbabfa6fb39b4f3f54136d6fe6d605e076dddd359817f59cfd3c78e6579cd4ecabd2d28c8829b4d4cb5dd2337cfbaf76d5feec73e8d2d9ea11db36862b78e98baef22c4e4a6bca2ecbd8bce4646c41937e11563196fb35fcc42843226a7db72a2058d8396db729c63e53d515f017ca4ab723a9af465dd9a3a1795b2767fd6ae392815929d683cd364a9ec9615324e139716fa39a8f3754513e5ecfd1154d297b6ee69cb717c5947b3fb79d140add5dec5ef2638dcb7bdb81ffb34b6788676cfa265633ea8589ae67e1253eb826282d7e42a5df6f8676d8bc0a6d18281cdbabee86dd9d2060b80264bcb25b2257e24e7c5d8a6f8ddcfbc00cd2afaf30a25907231fde068f17a2477b3a46f96fa5c2a2427c9c89b3259b733fbc8bad05e261d515dc5ba34d2cf019f6f2d745fbfccfcf64d176d29415bf7f4b39ce33cad7a9d33c7789ae3d9d2c88282e2773753c75bea51c844a5fbb687f7639fc616cfd00e5928cbae6225472533e28e7c08ddd4b1dfcb5a57e6d87ba188c21018c583eb267bb549ee348a07c7dafed2f63ef599897fde30df6faad9a9b6eca48efb3ed59ee4b389bed7585ba09fe8c562924d3daf682168323ead10cbcaf4b68b2b969958bbaec46bb53dfb62df9475ad8f64af71e5c986c5e2e1e4ded7603f0779be75d0bdf04b66e279a18cacc1d1d63d2d8f94ac587858d71d58bffbcc72deb0e74b367e3778cb6e54efbeedd5fdd8a7b1c533b45b16aef49049222517d6a2e440aff43ddfc77e37c37a77d656fc6ae88ce2c18a04a3e9b33f4d32af288abe55eddc74fddc2ba9cf4cfcf3cf4a3a766ab230fb109b12b8a62da7a9b63c4e1d379d5539f9ec5b7dcfb4e59d7e3f6f31d8508f64427c297acbbcec2490b32fe1b613de3cca4cf822b9f4bdace28e6504fe77dffff09b56e46fbbc6c069f539db17bd4b56959364e4c221bb68f677ce49477cf773e8e75b0633eecdf8fdeefb1ffe90c8cbde078f02cf10ded63dfd2cc713c52cf63d2f7b1cf5f5f39c31972778bc22b113e4a2c52ccadeb73dbe1f7b33b6788676c7a2b9315f6284e4281e1c1494a2193678ec83513c38c908b68477f3e6ba5c05659fde50ff577137cfc3fc7e6c36f5f76e554bbd6a216f59ae5515ae49fc7e3b8a07672aade4cd6b00fa43cecb3711bccfb482fc595c90acbfcf330933de967131aa63a551f6c8bccf4d19853b39d6ab4dbd184d7bac2515e40a783b271e68db43a9033369ff2df5ffc69deda1ed5c32edf2d6478e64dbb15f374ecc58edbefbfe87b79931e3a35455ed7ece21f8f32d181b4bb2eed916aa2e931bc97aeaeb9856ea8ec7b6ee691de76ece71b665dd7aa6e37c6641d3847b3327e95794eae7c6cb01999013b5b38f49f0cadcb79ddf8f65c77ebadd3d1c5b0bf50c0d858514bbc2960068afe94cbca6de6a1445bfe67cfe75c3c70d1289dc266bcf5e5a5b55626a6796d094c8dd295973b92a3754726ae2b3a630f483cc8b39fd527998d4dfcbb8276fe6b8cce56509b551c74dd8fad235935ecbe47829750e17d942f5056e7f173e56ced5aeec44f4a9ea19ce7241f3da4775b094aa71ad19f922736ec60299bba05216c77efe485fceb7e6d83002f78183eb63abe3b1ad7b7ac6719e6a1cbdcd58e99673b2e2a68f73a74dcbb9898594274e2fdc981366ddb701dd8f65c7fe27e3ab4f636b019fa141b0706ecc296c2ea5dedd97b3c87a9b576e265222ab8541c2325b67b829ae49681ab7e2cf163b14effb4eeec74d08dd345774ceefd407b020e88576d31273bb99bc9cb5e509dd5627785974ec9b056ed44bb2f6249b6d62f846e7e2fa824e7896e392d91777e6cdcc24ed6d1dab60866cbfe64d8eeae0a39ffb74be558e6fc6f39dae32a7d7a5ad7b5ac7f9b2e038cb99e3d8c488f9fd971d3d07b3f1bb7da1e8beedfdfdd8b3b1c533b4651659ece6b9c99e8fa787a72d1ddf56e26621e23a8da8570cec4f2d88dc2c46c8feac4452d7b51d2bdeb769919be58a04f82931bd8b835929fdcfbfff75d3123367c3acbade0c2106d04ce6cda45e716c5527f66f65f9f27a2e960420ce31c12d916da373164c092eef25253cf5736fced7c28526c52f740ffcbffffcfb5fb5dc9643a1ad7b5acf3e739c3b35f20e1ca516143a119c7d8ddf9d71dff6fd7e4c8ed98bb1c533b47dbe18feef9dbf728e7a329e1e3a5918251ef2621dbf6a3b2e552ea35b254495494cd54a7d5359167f2ef155136f3a6c51845f62bb7ee3e9e1171ef63d510c6b155ea974d36976fcc80d7a4519acd72ac6d826d9b1ab08ee13b52569cf276ec8b2ce27eda9ea9afee3787ae81c336e3243e77c3c57f7f5bc2077a4ed540c60b25a9bb80e1ed9628e424171c5e915f34fe28bb55d9e4b9f0501c0a2d0d63d9d8a9b2c3a4ef0cf40080fc61624ccbdd8559ce6e3925f7fa2f2448d232bdeef258f632ccead96b06942ec2a3372955ac775134bf94c7495702617f7832a31b6a9b6544974658eb5e1123b8ed8050000008045671112540519036b2cb5a37850f6ebff7f7b7777dcb695860118ebd9fbb802c65b41bc1558b9e16db41584ae206405962ba05c41e80a56bee5955441ac0a62b182a882ec20fe9085290002f14302e0f3cc683223d114055119be7ccff9cef7695b388130b1a9193e3fc620a946612fc268fabd36d1b25eb598a87c178fa5d1b5df7b2caf2380974d01cffc10ffc659cb0000d0d0394f631e9b294cec7d2e70a6c172d1e534ec08a9170d426fab905bf258d2a5e88bdc24e6aac7d2f6b8230000386be71076cb965d9ed481c388ee8fbd67f7c81e22e4f6d65ce742ef32426fd91eddc7d823dddb39b8f1bbbc887ddbd727188a0500009337f969ccb107f77dec837cce31a7e1d6d983fb104b7aa7b29cf57dc1e73ea4d7fd584bb4d7bbed755cfb4f055f4e3ff7aacfa0bbf7586ee239f7a1e0cb45d70a0000a8e92c963147e0fd66f054c9009f6386cab2eff5f65861ebd8d2dfc36a36dfe47e17d7a768ac631fed659c6f9b9d717bf020ac0e1fcb32ae4b3685b9f17e650000e0ab73deb37b5f302ce9bb230e822a3be268cacb959308718b1a37ed5d84db41bcb190ede71dc0430100804998fc32e60a6581b6f7c011c3928af6693e4e7c6f2e0000c05108bb4ffd1ce7c1f6a9ec2cdf9b23fcdc0000009377966137c26c5583dbdbd2d698065c361d3a9bd00b0000400b67177657b379daaafe9e24c94f15377b13b7ebfa7bbfae68759358dafcdfd56c7e7be0d144000000e49c55d88d00fbaee6cddfc5b4deaebef7cb583a5d76be6bde1b4b9a0100009a3bb766f7d0f0fa6b2c3b6e255ada2f35836ee6fb1864050000c081ce7940555debd56c7ed3746855b4c9bf1d187401000068e1dcc2ee75c1e71ed34c1ae7ee9649f7f7febe9acd3775426fba64395d02bd9acdbf3cb36c3afdde6f9324b92bf8dadd91cefb050000989c7f9ed3af74bddb5ea72d6d4c5b7e15fb62afd6bbed1f69908d3db53f54dcc5cf7134d17ddc360db3d9b9b8afe2e3a262daf2bee57ab74dbfef26f6072fe23eaee2f30000003470566137f91a78bf4420ddfffc1fb147f6b9c09bc4d79fbb4d95b4d15dac77dbbf875065a1b7c57d02000010ecd9cd4903ef33470375e5261f74010000e896b0fb54ebe9cb35fcec1c5d000080fe08bb39b16fb6ee7edbb68a8665010000d00161f75b65e7f03ec4d4e44fb1dfb68efb98f2fca1e4b66f9a1e6704000040b5b31b50d5d032f6d8fe35402a42ea4dc990aa1ff34706a5c71045882e3a67f7e5c07e4e00008049d0ec7eabe85cdb4ffbc3a462a2f31f4577b07f366e0cbd2a6a8c1fd6bbede782cf030000d092b09bb3de6daf62d9f1437cfc67bddb5e7670bf6958fe572c834ee2bfadef17000080629631ef59efb6cb3e2632471b2ce00200001c419fcd6ee132df09d914fc287713ff9901000046a12cec763125b86c3fea248632ad77db34ecbecf4d67bed3dc3204ce70060080f265ccdff7786d2e6292f1e8c51edf2bcf2306a62cec7ee9f1611ab60600c0a0bc88f360fb5034d938b588e378807e94ed39ef229016aefa88a9e3000030182fcaf6d6b65d0a1947f03c167ce93b6d28f463359b2f4ace7f4e2ade803a44d1aa8fa2bf73000038a917156d4f17fb76cb962bff122fca818ec41b54d725f776dff65ce78a37c02c61060060705e54ece3bbe8e0c15635b8bf0abcd08d08a2b7b172a24859083ec429f6020300402355cd6eebb01b67cb7ea8b8491a78afede185e656b379faa6d26f1541f72ea687b755f6ff04cd2e000083f322f6d616f961359b77b194f9ea992158bfa4cd50fa82bda3ef079397be41b49acd97abd93c7d43e95dc5cf9beea7ed6a054559d8ed622f300000742a3b7a283d23f64dc11da72f6e5b3542e994d658ae5cb5c4f2bb78c1fe6e359bdfc76d6f2a82389c9d58aa7c191f6543a8f62d6285452bf1bd0b8753b5dd0b0c00007dc8c2ee4d49d85db60dbbc9d7c0fb79359b5f3c1378333fc4473ac4ea310bbee97fbb78d10e6311cbfb2fe34da7cb1a7f3bfbdeae77dbaeceb42e3bce681267660300303dfff8f3cf3f93583efc7bc94ff7efae9a9bf83e3707b452fbb2d6f7b6c317f11458cde6b7456f80ac77db7fb85efd69d8deee4bdf24baec6a654484ee2f2561fb3ffe16010018a2bf9addb4315dcde6654b99975dedf98b66f6750cd4a9da675826dffaa637f9945bf2acf565743a686ff77d4cff66d3ed031d5e8b65c9e37a1074010018aabf9adde4eb8bee34d0fe5af238ffd575988c96370dbd3f7774970fb9e5ce5e80b7a4d9ed4f2ce9cf026ed3f6765ffa66d555d7fbdc9f6975dfaf77dbaae3c50000e064fe0ebbf1c2f64bc9109af4e8922ecedd7d225e4c2fe2c57f51b3dc94d6b70561b73bf1c64e3ee0b66d6f33f7b1a7beb7e7f833ab303a7f130c0000bab21f76abdadddef7e645f0bdc80583a2e0dd84d6f740c26e3b3db5b78fd9f338026e974b959f88fdc3bf957cf9e37ab7edea48230000e8dc376137a96e77d317daaffa7e81bdf7585ee502c34f1ddef5a7dca02bc7a61410760fd3637b7b970bb7477daeae66f3cf25413dfd7fc16bad2e000043f6cf82c7960ea3f96fc1e7bf8b56a997e5cc45e2c5f4757ca42fbe2f3b6a7d7fcac2f36a367fd83bdee868619e71eba9bd1dc4f371359b5f57fc4cd7822e000043f7a4d94dbebed0bda96852073194a6c7d6f72e1734ceb6f5d5ec3eb5f79cebbabd1dcc73ee99ed0c0fd1ea7a53080080412b0bbbe98bfacf152fe6dfae77dbcd907eb00e5bdfbcb36d7d85ddafceed7915fb746f2bfef67fec7ae2330000f4a130ec26ff7f915fb49c3933b8c09b399706ae4fe71a76cf79c5408da0eba821000046a334ec265f5ffc6e9e390777b081376fca7b2bfb724e61d7aa805a41b7b7e3c70000a00f956137a99ec89a1945e0cd4c716a6e1fa61c764df9fe56bc197453f1b7609f2e0000a35327ecbe8c17f0558177b4676e4ee13cd43e4c2decf6d8de8efafce6d56c9e4e5f5f57dc247d2e5f38a20b0080b17936ec26f503ef7d1a24c67c24498fadef7d84a2d1b4be630fbbb12c37fb5d3ef9395af8947b1363cccff5f46f7af34cb32de80200305ab5c26e523ff0a62f8eafd6bbedf5149e12e7dcfa8e2decc6f333fffbd2de9688e7f5e6996b24e80200306ab5c36e523ff026b17f7539a517cab9d6370b54936e7dc71076b5b78789e7f0758d7dca822e0000a37750d84dea2f7fcc7c8ca6773281211341eb323efa687d6f4f79dd861876b5b7cdc4755bc6c7736fd28c7e3b020000244dc26e66359ba7e76dbeab79f3c986dee4ff61e2b2a7d6376b186f3bbacf5a8612767b6a6f1ff78e059af2f3b26ec84de2ef7469ea32000053d038ec26f58e2cd9972e0fbd3e76703bb61e5bdfa305b45385ddbd370eba6c6f4ff6c6c1b1c5f36f79c01b2f93da6b0f000049dbb09b1cbeac39f310ff6633f5e592636d7d8f1976a7f0e6c0a9e5ce0e5e1c780dd3fdf50bcb960100989ad661375373c26b9149ef97dc970b7617435e96db67d89de2b2ef5368392d5c9b0b00c0a475167633b197b7ee1ec122939c845ba4c7814b59e8db349da8db75d86dd13c5639c7f6b68b73a03f44d0b537170080c9ea3cec26cd06e39439c7d6b7eb614cd9353c28f87611767b0ab8dadbe6263d280e0000f27a09bb9908bd8b08bd5db4965adf761ee29cd567af5fd3b09b5ba2bcec28e0e68f63ba997a1bd9617b9b798cdff9e4f7c70300405eaf61376f359b670ddf2183acaa687ddba99c8c7d68d86d3001b8ca7dfc6e6f9a2ec31e938edbdbcc5d04dccdd4af1f000014395ad8cde49abfcb0e836fa2f56dec3e42ef66ef7bd40abb11d4ae5a0670ed6d37ee726f1268710100386b470fbbfba2f1cd5ef87735a049eb7bb887d8cfb9496a84dd0e42aef6b6bd87bd015d064e0100403879d8cdcb0d34bad0fa36d34173fe10cbcdcb82ecbf630f689390fbc9e4e4d6ee72d770f26f1200004053830abbfbb4beedf4b864fc10f7b9a158535f9eacbd050080811874d8cdd3fab613d76f111f5dbd715026dd83bb89bdc053bfa6da5b000018a0d184dd7d5adfe656b379167abb3acb37f310cb9f27dbe26a6f0100601c461b76f3b4becd74344939d91f6e3525da5b000018a74984dd7d5adfc344e8dd34b856930cb9da5b000018bf4986dd3cad6f7dabd97c194d6f9df6f27decc91d7d68d3de0200c0f44c3eeceed3fa568be0b7a958da9c4e575e8c3dbc696f010060dace2eece6697dcb45cbbbdebbc187f56ebb1cd2e3ac4b7b0b0000e7e5acc3ee3eadefb772c71525f1f86f87f2d8ead0de0200c0f912764b687dc7477b0b00006484dd9ab4bec3a4bd0500008a08bb0d687d4f477b0b0000d421ec7640ebdb2fed2d0000702861b7635adff6b4b70000405bc26ecf7a6e7d6fc63621b9cc6a367f1dd7e8527b0b0000b425ec1e514fadef6392249bf4636c6d655c8f65c76f04686f01000061f7947a687dd326f37ac84b9d57b3f9cbf879971d35b8da5b0000e0096177207a687d3f46db3b8865cef1f35dc5cfd8760faef6160000a824ec0e5487adef7ddaf6ae77dbcd297ed298a49c86dc372dee467b0b00001c44d81d818e5adf34305e1d2bf4761072b5b700004063c2ee0845eb7bd97049701a7a977d9ddddb32e47eca4d99d6de0200008d09bb23b79acd17117a0f6d7cef22f476d29a46fb7cdde071dce7866a09b80000402784dd8988b0b9888f43f6f87e88e5cd8d83e66a36bf8ae9ca755be6c76870af863a351a00001837617782a2ed3de4689f464b9b57b3f9eb38e3f790ef731d53a2b5b80000406f84dd096bb07fb676cb1b6deebb9af77bd4e158000000c2ee193830f4a67b6817657b7957b3f9cb58825ce7be845c0000e02484dd3312cb9baf6aece97d8cc0fbcdb2e658b67c53f3dfa767fb5e9dfb350700004e43d83d33d1cc2e6b2e417e9bb5b271dcd1a6c610aa4f1194edc90500004e46d83d53070c974af7f1a64b9a7f7de676856d300000c02908bb676e359ba7d3917f697915b4b90000c0a008bb1cb244b9c86abddb5ebb8a0000c09008bbfca5c199b9e9b2e5cbf56e7beb0a0200004323ecf2b7185e755b23f0a641f7a2ec7822000080537be1374026f6dc5ec459bb65045d000060f034bb3c110defe782f374055d0000601434bb3c110def6584dbbc85a00b00008c81669752d1f02ee2eb37ebddf68bab0500000c5e9224ff03b451a849112b346f0000000049454e44ae426082);
INSERT INTO `sasic_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(4, 0, 0x89504e470d0a1a0a0000000d49484452000003bb000001bb0806000000020582df000000017352474200aece1ce90000200049444154785eec9d3b731c4796ef4f5603baeb0d39eea2210cf501860ad2172616dd33116b086390ae28878c758496457a823cd15241ce06e90ce80ac680c6468cd0d810e80f62c00f301808cd710784772f1e95374e7535d868d4235f5595d5fdaf08c6ce0a59f9f89daceafcd739795210aeca09f4dadd5522b94e44bf2512af89e47638e86f56de11340802200002200002200002200002200002534a404ce9b8bc1d566fe90f4b7479f98f940e9e12d13649b919bedbddf36900719f2f2e96e23e09b114ffcbbb241d908cdec745e62e0ec2a3bde1ffc60502200002200002200002200002200002151180d8ad08f4a899de62779da4fca6402cfe4281d8a420d80c8ffe725455177bffdeb94b01dd8dc5ac94cb246989047deca8fdb744f49e84d82316c3ade0a0cab1391a03aa01011000011000011000011000011068080188dd8a0da52476aff7e90d116d52eb7cdbb5873416b72d16b5c132915c26a25f558ce39448ec9188f62898db86f8ad983e9a0301100001100001100001100081292600b15bb17113efe9df0c9a1d863993d80e073bdb06f7c7b7c4ed0b7a4444ab0ebdb6a6ddb97e9fa45f86a1dcb419feb37fe0a652d4020220000220000220000220000220308b0420766bb07aafdde164545f18373d128573ad50c51b1aefb98da24714c947de09dc2c083cc64086145c6cbaf6681b73c78d2000022000022000022000022000028d2100b15b83a9922455ecb9741136cc7b61c3b430e7dec2ca3289a047243faf61982e9b7c45add6ba8ab077d928ea020110000110000110000110000110682e0188dd9a6c67b07757a5a7af38cc39ce842c041f6df499ca4d0565387c7a1852ccc9a5aeaee83d45c97f1ffdb780f7fe2657246f91a0bbc9ffe7a21f5c1544af0383a20a1000011000011000011000011098050210bb3559b9b7b47c8b2ee739d3729677973db6bfadb47b1c3a2c688f843c8885acc36383ae8e2f62412c59045b25c482e8ad7462a03110000110000110000110000110681e0188dd1a6dd66b773851d49f32baf0652c383999d430a1948b90e7c9a686d990496e53abb5577598f0876cd062d5c00b7d4a4284e1f10e7bb07181000880000880000880000880000880c0350210bb354f88de42e7282369d429b5ce9746c9997aedee2a916451689ed8ea6aace2351f676493d5d935b6c4d3cde3eb697ab4df52448f90bdd9b545501f08800008800008800008800008349b00c46ecdf61b2691123fa77643886f273d97c6a2b041d98d93045eecb165f1abe6d116f2ebf07837acd99c681e0440000440000440000440000440c0130210bb1e18a2d7ee70e2a7b4244ea7d46addcd0a2f1eee83bd644f68f699b9c37db8ebe1a0cfc71d35ea8a857df4518fa4e431aa88de57e1a0cf21dfb8400004400004400004400004400004669c00c4ae071320debb1ad0df32baa224e0c6c29c87ded0068bdc490e63a2f71b0573bd0d07fd51166885e228020220000220000220000220000220308d0420763db16aafdd61cf6bfa7edc883ec59e54a261787314169f1b2cfee8d37e644fa618ba010220000220000220000220000233450062d71373277b714fd2bb235e87831df6d8e2e20c56f959acf94060f0c24c0101100001100001100001100081192700b1ebc904c8157048be7465a538a11789cd8c0cd6c372e0e5c9ac463740000440000440000440000440a03e0210bbf5b1ff20e03811d3c53c9fa9fbf18dee48fa257cd75f52e9e6d8bedd2512729b828bcdd1d1452af7fb5c463d8499ae1dd9e4f398d037100001100001100001100001100081f20840ec96c756b9e6de62779da4cc48be94bfff344e6e25e851fcef66c6e2538efa6d6226e6113ccde454a714d132f6372b4f3d140401100001100001100001100081a92500b15bb36993bdba471947ebbc0907fde5c92e6a9fb51b9fb12b3629380b9be2e935386bf72db55aab59c734d56c66340f022000022000022000022000022050310188dd8a81df10ae795998a5fc5df86e97cfe08dafb130e5f4accdc563614fef3649b9395e6ff16dd59518ee5d16abc51997c7fa246983e6ced79b22e4aba389964000044000044000044000044060760940ecd668fbc47bf98f8c2ec4e7ebc6652e2e7b44b49a9b9449771ceced8d852f6dd61df67be38c60d5b1c463908f7c15eeaac34039100001100001100001100001100001f7042076dd3355aeb1d7eeb0d7f6b3d41b84f896a4e4e3867eab5ca179c15322b14722daa34bb157b6f88d332a07c13249c921dae9e3cf1fcb29091136292cdbdc34b8130440000440000440000440000440c08400c4ae093507f7c4824f889f1d54355ec5304c9988b3379b88c8f1bade10d111097144920e4846ef498af7aa427898384bde222196e27f92ee1249ee97ad787f45add63af6e63a9e39a80e04400004400004400004400004a68c00c46e4d06ed2d748e1c8625b330dda4d6f9f668df6a22a63943b3e9fede9ac864360b91eb9b45d01f10000110000110000110000110f09800c46e0dc6192661a23f59353dda733bd70af3bc9c577b7ed38f26b2ea42e93737308b74e94cd0000880000880000880000880000880801201885d254cee0a151c35a4d2d02b22b11d0e76385c59eb1a2682e2f378e5e75a37565b3809c5361b63b55d456b200002200002200002200002200002be1280d8add832bdc5951e49f1bd66b36f89281c0f53d6bcff5af1a1e0fe689948ae92a46587e1d466dd1a79a985d83311f1668de22e100001100001100001100001100081692600b15bb1757b8bdd7592f29bc26615c3940beb5128901c81c49991f9df5d0749a48a5a7d1327bd127440add61e924d15e1c2df410004400004400004400004400004740940ecea12b32cafb05fd7384cd9b26bd76ebfcaa6cc4704f135cca67c2b29c4ff372bab327ba1df0fcb89f7b1a0a5e83d45744073734710b62ead84ba400004400004400004400004400004b20840ecd6303752ced7751aa65cc390d0240880000880000880000880000880000878450062b726735c794ee1edacc90268160440000440000440000440000440609a0940ec4eb37531361000011000011000011000011000011098510210bb336a7895610fcfe8bd588acb4af13efc67ff40e53e940101100001100001100001100001100081ba0940ecd66d01cfda1f0adccb1e11ada61c49343c03b7d55a47a229cf0c87ee8000088000088000088000088000085c2300b18b0971452039168985eeaf0ab148daa0b9f3f5f0682fc9bc5c78070a8000088000088000088000088000088040650420762b43ed6f43bda5e55b7439bf4d449f69f592cf0296b48af0662d6a280c022000022000022000022000022050010188dd0a20fbdc449c153aa0cd9c73738bba7f4a112d43f01661c2df410004400004400004400004400004aa2400b15b256dcfda4a3cba474a61cbf97d87e0f5ccb6e80e08800008800008800008800008cc3a0188dd199d0189d0dd2bf0e80e1352f12569392561d5383d08de199d4b183608800008800008800008800008f8480062d747ab54d0a75ebbc342377b8f6e4a02aadee24a8fa4f83ea77b6fa975be8ca4551518104d800008800008800008800008800008e41280d89dc10992645dfe2667e85f86833eefe3bd71257b7c592867646c16afc3c1ceea0c62c5904100044000044000044000044000043c2200b1eb9131aae84a6f61659984f8d944e88eee2914bc427e1d1eef86558c076d80000880000880000880000880000880401a0188dd199a17f13edd8bf9839cbdb7991edd494c05a2f9945aadbbe1d15f38f9152e10000110000110000110000110000110a89c00c46ee5c8eb6bb0b7d00949d05a460f5e8583fe239dde15ece17d130efacb3af5a12c08800008800008800008800008800008b82200b1eb8aa4e7f51478628d134bf5dadd6d22f979eaf011ceecf9ac40f740000440000440000440000440607a0940ec4eaf6daf8dacd7ee1c641e3314d1a7e13ffbfc77edabe0acde536a9d2f213bb33656dc00022000022000022000022000022060490062d71260136ecf0d3716e2dbf07867dd661cbd76779548fe39a30eedf0689bbee05e10000110000110000110000110000110600210bb533e0f723daf927e09dff5975c20c83db7d7c273eca26fa803044000044000044000044000044060f60840ec4eb9cd73cfd495f277e1bb5d3e33d7faea2dfd61892e2f39143aedfc5d24abb2268c0a400004400004400004400004400004740840ecead06a58d94480fe23bddbe27538d8597539a4aa84b5cb3ea32e100001100001100001100001100081e92400b13b9d768d47d56b773689e88bd421b65abf717d0e6ec139bef0ee4ef15cc3d040000440000440000440000440c0370210bbbe59c4517f72bdba9236c277fd9ea3a6ae55d36b77f8acde3f65d4fd6538e8b300c70502200002200002200002200002200002a51280d82d156f7d95e778754b3f0ea8b7d03922411fdf18bdc38458f59145cb2000022000022000022000022000024d2000b1db042b69f631d7abebe0a8a1a2ee141c4504ef6e1140fc1d0440000440000440000440000440c09a00c4ae3542ff2aa8d3ab3ba2917314d1db70d0bfeb1f35f4080440000440000440000440000440609a085c89dddebf77ee9290b7a66970d33616956382eaf6ea5e89dd85956512e2e7541b281e798439e9ff0c569993fe8f023d0401100001100001100001109846022216140171d2a0df4ee300a76c4ca79c64392fc9930f5e5d05ef6e6e66e6a1c8a5edd47dbf5366d02918ce2945b41cfeb3cf672ce302011000011000011000011000016f08889c70536f3a898e5c239099602a3efae772fe249557057b7527dbcdddbb9be3ddcd4c708589e02b81d370d0475488afd641bf40000440000440000440604609b0d895333af6e60e3b4328f616bbeb24e53729032b3d037316cc6ce12a5e87839dd5b4fb30271b38351543d31b383274190440000440000440000440a0a10420769b68b8883e9d0c1b4dbcba4744f4ab1b43aac1ab3bea43eeb9bbadd66fc2a3bf709faf5d10bb0d9c9410bb0d341aba0c02200002200002200002d34d0062b779f64dddefda5b5ce99114dfa70e2743545635f49cb0e457e1a0ffe886d85de8842468adaafea11d070420761d4044152000022000022000022000022e0964895d4e848484332e495bd725de9388f6c2e3dd30ad2a5d4169dd1d8d0a4c84f8d0232c568990215c03751545f9d8a89bd10310bb55b0471b2000022000022000022000021a04b2c46e6eb65c8dfa51b4020226a1c21574ebaa095f43acab64302d6d6526b483d89d1613631c200002200002200002203035042076a7c094395e5d6f3e5af8983c6b0a4c5ff91020762b478e064100044000044000044000040c0940ec1a82f3e5b6dec2ca3209f1736a7f3cf2b6f9762c922ff66b5a3f20769b6631f41704400004400004400004669700c46ec36d9f734eb2375edd11e25ebbb349445fa420c739ad0d998710bb0d3114ba0902200002200002200002204010bb0d9e04b95e5d127f0c073bdb3e0dafb7f48725babcfc47469fbe0c077d16c3b83c2600b1ebb171d0351000011000011000011000816b0420761b3c21323da5927e09dff5977c1c5a13fbec23c7bafa04b15b1779b40b0220000220000220000220a04b006257979827e59bea256dca1e634fccec5d372076bd33093a04022000022000022000022090410062b7a1532333bbb1c75edd11eaec7dc6e27538d8596da84966a2db10bb3361660c1204400004400004400004a68200c46e43cdd86b77de13d1af6e745f886fc3e39d759f87d56b775789e49f53fbd86afd263cfacb91cffd9fe5be41ecceb2f531761000011000011000011068160188dd66d92bee6dafdd7944447f4a178be7b7c3a33d16c25e5f9967033740ac7b0db6e4ce41ec960c18d5830008800008800008800008382300b1eb0c657515f5dadd6d22f9794a8bafc2419f85b0f7576f71a547527c7fa3a30d08c3f61e6e891d84d82d112eaa060110000110000110000110704a0062d729cef22beb2d2ddfa2cbf993d496a4fc5df86e77affc5ed8b7903b8e883e0dffd93fb06f0535b82600b1eb9a28ea030110000110000110000110288b00c46e59644baa373384b9811ed14c0fb5a48df05dbf571242546b410062d7021e6e050110000110000110000110a89400c46ea5b8ed1bcb39a7b671023167eff1db70d0bf6b4f0b35b82600b1eb9a28ea030110000110000110000110288b00c46e59644baa37330b7303437f7343999195b9a41964572dc4ae1d3fdc0d0220000220000220000220501d0188ddea585bb7d4fbf7ce5d0ae86f29159d8683fe2deb066aa820e7ccdd3f86839ded1aba8426730840ec627a800008800008800008800008348540a962b7b7b0b24c22e811c9460ab15a8c28c45ed639b9d9e7d38ad7e16067b596fe5a36da5becae9394dfdca826e708a28403f6f46ab117a18b8f0710bb5ad051180440000440000440000440a04602a589dda1d0153fd738b6e6369d21f44c84a1ef1072e6c99b70d05f9eec7fb6e0f77da43ef44f587bcb21767db023fa000220000220000220000220a042a044b1db0949d09a4a2750e60681d4b0e4ece454ee8e1c1aeea3fd689904dd2529978888ff1191784f820e48d201b58283f0e82f472eec96b36f3743ec76f868a5cf5cb43d8375a432d5e100b1ab430b6575087cb5d8bd2722f9400a714f10ad24f79e48a27d21c46e40175bdf1fffefa14e9d280b02d34000cfc634581163000110a88b407962b70d516263d470d01793f7670a0dcbe454f15e60418f48107b527fabd46f49bf10d13671d8b5e5deda5ebb2353dacc12fc10bb4a064a2d04b16bce0e779644e0bf16fff3f647d1f90b12f4a0b009219e6d1cfff4bcb01c0a80c01410c0b3310546c4104000046a2700b15bbb09523bf02a1cf41fa98add34615c34acded21f96e8e292f7bdae92a08f8bca17fcfd3416be1185e13ffb07ba7565885d4a15fc597b7c751b9dcdf210bbb369776f471d2fe6e5f95f89e88e7227256d6dbcdb79a85c1e0541a08104f06c34d068e83208808097042076fd33cb2b6a9df7c2a3bdf7aa62975ae7b7d3cadfb83f0e519ee744562c72d53cb8ba7cd8e31bc89082b96dd550671db1cbdde92d20445ed72c4979885d437065dcb6d6eea64534386b4a12ed8e2a1352ee53109c1045870145fbbe84037fd5ee7208cb2864597decf0f0aab342c9461268f2b39108f5bf13d16d55f852d0931f8e775eaa96473910000110502550bdd895eef697aa0e725acaf5dadd6d22f9f98df108f97578bc1b668d334902c59ee22faa65215e13d1665e987366822a49bf84effac97ee16a7b3d0dad657c4080d8f5c8b8658bdda2a1b218e6bdb092e4ee0fc73bfb45e55dfffdabc5ee6321e98561bd2781b8bcef8b68371c036e038154024d7f36d6163adf91104f55cd2b24bd0cdfed3c512d8f7220000220a0430062578756cd657b8b2b3d92e2fb946e9c5244cbe321c471987274b14a91e8390853b61df92949dae47fd7fbb87c8b2ee60f32fa971aca6ddb9159b91f62d77f4bd72d7627089d90942f6520b6aa12bebd85ee0b29e8b1a9a5e009322587fb7c27d0e467e3ebc5ffb813c9167b7555afc333317fffbf8fffe744f5069403011000011d0210bb3ab46a2e1b0bd8cbcb7f647643d20605e23d49c9a1ca3661ca6f38f11445112783fa7005c13249ba9bea5d5667f39684d88e8b4bc9e1d4bf4abfd5fe981cf52e4d5f49885dff6dea99d81d07b62f05bd2c3ba470addde505b1fa5edd0993c21be4ff1c470fcd0834f9d9d015ea81109def8f7fbada7261460c778100088040360188dd86cd8ecce387acc7c121c7729b5ae7db4afb7fdbdd55a25854f3bf0cc16ad82984301b82fb701bc4ae35c2d22bf058ec8ec67e48423edb38ee6f9501c376fc1c86fdc360a75346df502708d449a0a9cfc6d78bbf5f89a4ec2bb3c3de7b655428080220604e0062d79c5d2d7726e7d2f219b72e04e65b220a55056ed6807bedce2322c1e2f7e67e62134ad8d76d42edda3d10bbd6084bafc076415b7a0793065854b6c4e513d7fb63d7dadd7fe924b0b9315e6465ae6a0aa09d8a0934f5d9d04caab5bf31d8b95f315a3407022030830420761b68f4f85cdc8038c4d844f00ef7cfceb542d56cc9aa881ced13fe321cf43755db44b9740210bbfecf8ca688dd84e48914f4cc6568b3e6c2f8a641e115f27f92a38746049af86c687a75f97dd2a92a3f80911170130880c0d41080d86da829f5056f71666497280c3240f359bd3d085d375680d875c3b1cc5a1a267663142ef7c9ae2dfefe2949f99d296329e83e16cba6f4709fcf049af86cacb5bb7c5ef63d25aef850a5840985400004dc1080d875c3b1965a9290663e72286bdfec5b127253e7ccdbf1810cebff689948dea2566bcfc4139cf471b520ccf915b55aeb26f5d702be018d42ecfa6fa4268add98aaa4adb360fe896df6d4e42c4e5e20eb27a94208b3ff131c3d3426d0b46743e7a824ecb5379e16b8110440c09000c4ae21389f6ebb12a5823325c78bd1036a050736e231c9fc7c30162a7dca599ec377bbd733346b8088fb7931779738abf3553fcff6541262693483a2ec226f77640a089cb3ebd1ec68acd81d32dc3f13f31d5bc1fbd562f79e90c48257e7c251253ab450b691049af46c68648f3e3913f39fd8be371a6950741a0440a0360210bbb5a1f7bbe15ebbbb7d23e114b224fb6db4b1de41ecfa6faa868b5d72e5a149f6fafda898ac6a3f10970f5d27cbf27fb6a087b348a009cf8656c8b5900fcbcaee3e8bf30363060110502300b1abc669e64af5da1df6e07e3639f070d0173307a3810386d8f5df684d17bb4cd8d51ede386c932e1e93940fd2f6fdb1b026415b2e1364f93f43d0431020f2f9d948c2adf9bcecdb45b672f5ae286a077f0701100081490210bb9813a90420769b3d312076fdb79f85d8dd0f84785634c288a2db44c11d11c93b52c48963d492c714553cf17729e8896b11ca1e2d6ee692e4099250691a04c5a79a804fcf868657175b0fa67a56627020e03701885dbfed535bef20766b43efa461885d27184badc454ec9a860fb317669ece1f90a407822816938eae93405cde4768b1239aa806041a426024bc8bbb7b7188f743312594000110288700c46e395c1b5f2bc46eb34d08b1ebbffdaa16bbe344be5efc8f3b326a3d95821ebb20652ac05db48d3a40000440000440000440208b00c42ee6462a0188dd664f0c885dffed57a7d81dd14912e0bc303afe6702712044e7fbe39f76fd278f1e820008800008800008cc0a0188dd59b1b4e6382176358179561c62d73383a474c707b1cbdd4a92ccf46df7f4c2bbebff9c430f4100044000044060d60840ecce9ac515c70bb1ab08cad36210bb9e1a66ac5bbe885d97827716bcbbf1f9a72456a4942b6298f46b9489f64412ed0b217603bad872b5479143ce230aee71b2316e93ed35d12effa761db924e2810fb01d1feffa5b97d1fcf331d66173e5be1f15024ef4941b705d19d89e882434974188f55ca7d0a82131e531d91034deb6f556fbe382a84e77f14dd9642c4c9ef527201ec4ba29326cc4b556ec3e771ee01cf5d12f1bcbd96f88f3ffa8d8fb78e39ab3a16940381592100b13b2b96d61c27c4ae2630cf8a43ec7a66108f3dbba3aee91c23924957d2d6c6bb9d87aaf4cb16fc2eeb67914b92be534aee25c4b38de39f9eab72982c172fa8a3e03109c1e2d63c8bb6a42d19d0ee39cd6fd5297caf0442c6d1523a9c6231e1f883422a7f163435f6d7e5dcd5e19b557694e04e44b44282f888309b6b9f84d872f95168b233aef9b1b8bf94f2a9d2f37fbd338724c4cb339a7b59e73368632cdc0b024d2700b19b63c1debf77ee524bac92a4bb447289887e3b56fc94880e48c6ff36c37ff60f9a3e19c6fb0fb1db6c6b42ecfa6f3fd78b3117234ef6f07248b3f17526e67fadbaa82b9b81abfa358e5819723314bb160bea227b9d9010cfab5e70f3078220a2c7ae12a14d0ed2f5f9cb3ef5d7d5dc2d9a18457f1f4b66c702b7f03cdda2fa6efc5dd256108897ae3da0aef8c51f01a3f3170e047efc0cda7c04d3668b1b400004863fc958145f9f09bda53f2cd1c5658f885649d0c71af3e40d45d49b16d10bb1ab61790f8be2b9f6d028135d72b518733dd2de42f7858d38d13977b76c062eea37e2a12976b5bcc676063f91829eb93e1779b24b2c10fe4f74fe9dcd3cd21ce66120c41353c1e4637f5dcc5d4d86d78a57cd24f970c17373dfa6dfa37b5df08bb72c48fad14502bf51bf84a497e1bb9d272ec6883a400004d40840ec269c62917b79b94e445fa8a1cb2cf56538e86f5ad651fbed10bb131f41d8cb2fe4ad5cc3cccd1d85477f39aadd784404b1eb8315f2fbe0623156c628e39053d9fabb71dd1aa1cc6533b0adffabc5ee632189b355eb5d423edc38ee6fa9dca4ed3556a9b4a88ca4adb360fe89aa07bea8baf1bfaf2d761e9014ccccbd17b0a823523edf78d77f5654ac09fdb59dbb3a0c26cbd66a43cd0f4559e3b4e597085d8e72713e8f91cccf6676e25e10d02700b1cbc260b1bb4e527ea38f6f7a05efac8add61e8ba5ca6482c91e0f0f5f8dfaf34e7c68710f7401ed1a5d8abdae30fb1ab69b11a8adb2ec6caecb29137f343874e36063bbf56e95fd90c6cea2741cf84a4bfaa8c63b28c4aa22e87e191265de47bf60371f9d055222daed072de988e63fcbefd8dc1ce7dd58a7ceeafcddcfd61b0d351653059ce0326f1dc3c13f31d9b8f3136fccec5fcc38fe4b97586fa5c1b187c9831b529ee0381592730d36237163601b117767c2fae8b39714a112d572d705c747c54c7ac88dddec2ca3205c13249b94c449fb9649852d71b12628fa2682f7cb7bb57665b10bb65d27553b7cd62cc6631abd2fbc4b3c3e17b469714745f251cb16c06a6f51327761a66098eb31feb5e4562d7d5714fbafd4a297f1288cbfbb682d79bf1287a059bd05fd3b96bea358c1350c9f31f4de7bc83b93859c5a114f450e53d92d6b60dbf389bb27d12ae422445ef89c20a500004404089c0cc8add5ebbbb4a2459e8ea79ed24fda2b49797cbcd9ddf0d8ff6de2b59c2b342d32a767b4bcbb7e8727e958858dcf2ffd5b3bf3b3bb1f7779b88f6a875beed7a9e40ecba33545935d92cc6ca16bb3ce6b576f75fa6217caafb76cb66605a3f0d8fbde163458caebc45ac3742ebc3c85c78d1d8036e9e35da88f2cd9b343eb278df5fd3b96b22763d9c9323e3f21ef38e89e035e567fbeceb4c65135be9d48fb220000243023329767bedce2322fa93e22478351424adbdf1fd9863a229cc164ce27538d86141d5b86bdac46ef271836d61bb27bb2c5bbe2212dbe1608705b0f505b16b8db0f40a4c36aa971300002000494441541763552d90d616ba3f1a7b37143d6c653330addfd6f87919a9bf6a77fb1e79cf8643d5d8673dc9c693b057ee9652f87c53fa6b3a774dde0f1e31497bf48c3ec698f2b37df675ef57fd40a35b2fca8300087c203073625751e89e9210210567619ec72d0e811582935a6587bf0af97578bccb82b851d73488ddabccda82f8e3465d1e5c5dbb9ff2515634d70a6d925d41ecea62afbebce962cc64316b323aabc4498ae2a96c06a6f59bf01abf6763b023d2eab062faa1c24392b44f811866ad8da2dbd6e7f1723d8a1f28c6c7659cc0cb1670cafd2a596e9bd45fd3b9abfb7e7034274bb0e858958aef93f14e98f22b7720376b5799b755f709ed81c0b4119829b19becd1e5bd9279c2e715b5ce7bd622777ca644f469d3f6ef3659ec0e3f42043d22f9b9a3077698706ab8204cdf6b3bdcf3cb1e124e6ca57364554e17c56b925168b2bf1762d791e54bacc67431a6bb98351d82cd99bbaa7d2c9b8169fda6cc46f7a589dd24bbab51c2abe1ab85765b423ccf3a5e27cea24d730f48caef0cfb7f7226e63f514d0a9464ede6f138cf566bd4ff820cd84debafe9dc557df698b1774cf20caf91e19cab31e56734f7ec6e3adc18ec7c625705ee060110c87d7dccd2a2b8d7eeb060c94a46754a241ee5859126c713f13e5fdd44466fa975beec7a5f669953bb896237092de730605dfb8ca37c1b0b5b210f28a20313a1c9950d135fd15d926294d1d92609da1b6a9dafeacc9f597aaecb7c0ecaacdb7431a6b398b5e9bfa538535ac095cdc0b47e1b6e7c6faad8b5095fd6c8dc6a75648a4e3b36e3c9067c2887fba5e34b27dc3b2f749ceb2a297cbcb4fe9ace5d9df7836326fb42d2be0cc4d07e51745b0a714fc78605cf9dd6c718537eb6cfbec9fd086536a1867b40409dc0cc78760b8e172acc9e6c7d3c91a48df05dbfa76e9a7a4b3652ecb63bec75d515baa5268a1a59d14162ac37e1a03ff41e2b5c10bb0a906a2e62ba18d359ccda0ed1b48f59826fb23fa6f5ab3230addf92db8de36f6cbce486e1c5f78424933342950485d57826e14adaa2406e9dd147bb695ee53879129dad5044f74888076989c38ae643d3facb884ce76e118b117e574c380c570497cfb3327a0fed77f198a47c6a1d05a0116a6fca2fe5d93f21295f0641b03b1e5511f38ba21512e2b1edb85413fa59be97703b08cc2c819910bb89d038ca085fce15ba893797bd85369eb96482893fba4a4054f68c6da8d8954a5c385336674296b4595778791c523fdc4bbcaa1af61c0e38af8dda05b1abc6a9ce52a68b31d5c5ac8bb199f6719ac52ef31742ec5ee31bc97b24e26cc477d2ec63ea41b3b1b5f1fe5405416195bcec03b8fd64913fdc7bac78f1b158528ac7d73c86057d6e5a7fab10bba67372cc4c5a470339caf8acf431c686dfc4342c3c8b3a89a4e063da8cb3b79b7cd0527c5c500c04406056b231e77a65a5fc5d56a8aae21edfd1441a261612f1deceac4ccfa7d43a5fd20947ad6b964ea9d8759af1d8956d54334543ecba22ee473da642d24600e98edcb48f53297685787646732ff3f6b4b2b7e792e49d1f8e775e8e5827fb22ffaecb9ecb07e2f2139b3370d7da5d9323766e78a6c7fb6e339e513d2e92f2249ec917f107869c739d9bd6df1123d3674fe5fde080c9e19998bfafbabf7b7cfed88a6c552fa829bf7131af3a46cb2d1ff17efc2a8e93337907e11e10980602b3e1d96d77f8acdbb4a454afc2419fbd6b372ec5accd9c3584cfdd5d0f077ddecb1b5fbd854e4882d6d22748338e236aa4d8cde51e5be3cb713bf9f40017ce37cd307878767db26e7a5f4c1763552e8c4cfb386562d7f8ac4fe6609aedd6859d4dbdbb79fb5f4dc7e352e88eea1a85c86e1cfff43ceb896f5a7fab10bbb64c6cf698261e5efe0863e60955cccc6cf3ee1a7e68129dac64706973cd267ac0c5b3eeff2f1e7a0802f511987ab19b1c0ff4732ae256eb3769c7bb140a8f6165bcd7b397259ef29361f91fcedc44b11b7f68c8dfb75bb837bb8e47318920f85b4edb5afb75130e6921dddaf54cf629936f4e84441d4c9bd0a6e962acca8591691fa748ec5a09dd58ec9a79578d8e029a9cf789b0f897f6f39093f9d6d23367ec11d41e437243d3fa5b89d8359d93dc398d2466d91f203a0f480a0efd35bab28ef61aafcce6dd4544b9d10da96277d16a4cdaed1981c34d2030a3046640ec667a5953bdba0ac283a3bf5f53ebec51eef144bc2733a02c01e37d387363c5eed2f22dba9ce74455d959b7235aae6bafee0df1389c2779c7611965f28667d7ff37bae962ac2ab16b199a371dd99815f6afe6cd3463b169e059ca141626c22667dca6f396fba7eb2d73f11437adbf658b5d9b3939b4a15d68fdd8f838b4dfc8bbab328f6cec6eb287d636345c45c0bb781e500708cc2281e917bb999ebe9bded58244563c3f72bdb93784cc62779da4fc267d62f91dcedc54b1cbac633b5ecc1f64267ee2d0f3b9f3bb75ef9d2e9c6f16fd84d8f5ff756eba18ab4aecda646b55ed63d90c4ceb4f668f72329cacd966c390847c185070623b93a3e1b9bb9c3c4bf9cab29fd5780cbc65ca1dce28d8b4fe8e0fc374ee163d7b564c14438855ec66154aadf011ca949fcd47199b36217655660dca808019815910bba9197ad392fd9411029b5fa7bfe1cc4d16bbb1e02dc9636af698ddbc2b11baa579a021765d59aabc7a4c1746458b59573db6598caaf6b16c06a6f533431749946c18bab2a3493d59f633dd031cf74141a098f435ef9ea6f5b70ab16b35271ddad0c613aaf26cda3cfba6c2d32664deb44dd7cf0cea0381692430ab62f76d38e8df1d3768c13e5de3bd9ec9d1459ca1392d4196b7e1cc4d17bb8a8257690f6b6cc38b8b250a82e139b791bc458286f347d201058213a01145d11ecdcd1da5ed039f7c79e4efe926e3f9366a0762d7ffd7b5e9624c5548da12b049b8a22a6cca66605aff509cc9871bc7fd2d1b8e56c2c2a661fb7b4f36063bbf9eacc6663c2aa1a7f6ddbe5e43d3faebbbd8756d43d3e753e51d685a3711a5ce7d95b909b1ab42096540a07a02532d7673f6df5e13398561af117d6ab3c7b3b7b8d22329be4f37af9fe1ccd3207663c1dbee70b6edaca3a0b8c88dbddbc9078a6522b14a52f279b81f6b3d9a71866e714024b7a9d5da9b14bfbd768733777f9153a775d668885d2d8bd552d87431a6b2d07331a0b57697131bdd36a9abece34154199832e631bbd89bb8b6d0f98e84786ac2b0ee7bd23c4d36e3c9cbf05cd6589bd6df4ac4ee42f74712f4c084b96befa385382c4ce864faecabbe5bd2f8598c875cb335b12fee0181692530dd62776165998448cbc47c5dece6895121bf0e8f7743db09d0b470e66911bb4a8257d206cd9daf5334f788a460719c95dcca741abc25213729b8d8a48bf9f5ec63a9e2eaad856e3266646336b55645f7d5b118531dda9a5d6651523d9aa46c06a6f53327178b4f9bc5afaaadca2a97367e9bf1b8e0a93bd6a6f5b70ab1eb139332fb62faec43ecea3e65280f02fe1380d81d9e8b7b94e1bd530a735531732f2f5995a45fc277fd25957aaa2a334d6237167fc567f0568536bb1dcdb374f33a0ccf6efde62cea411d8bb1a23e8dfe6eb308d509032c9b41d9f517f1b4e458547da97f87d8dd11a5022ea8bcacb96b33275d7fb028b32f65f1cb335b99e3a9732ea26d10683a81e916bbd9c7ff5c89d85ebbbb4a24ff9c6a48476787e6b6c10d5b8649973109a74decc682b7387cb80c94aa75a61e85a57af36439885d5372d5dd57c7624c657456d95ab9018d8cad653328bbfe229e368bdfa2bacbfe3bc42ec4eee41c83d8cd7fea6c9e77d76ccb7e3fa07e10681281a916bb89c0490be7bc4a50d56b77b789e4e7294673e2d52d4850c549509c8449bb9e74d3287693f9c019903f73cdcbb23e27736dbc0f10bb9616a9e0f6ba8558d6106d166cb1d615f4e487e39d972a08cb665076fd4563ec2d745f48418f8bca79f8f7d43d9136e371b1075a9753d3fa3b3ebeb2e6aecdf3edda866bedaee959bb85e77897c52f6f0edab085d8d57dba511e04d409ccaad8253e7a2811a2ff48c5e5ceab9b25a6b959a7de3c75b317979c5ab1cb67f05ecee71df99306e79448ec91a00392f228fe377e09b144fc4f728666c9199bd3326f67417f4badf365d767fe42ec16cff1ba4bd4b1182b1ab34df6da51dd3a8988ca665076fd55f02c6aa38cbf67ed5bb49a1f0eb25beb8eb569fdad42ecfac4a4cce7b3ccbacbf85008b1abfb74a33c08a8139805b19beec993f27714d0ddd42cc90ef7d0e6788e4b1139eaa6cf2f39ad6297475d987d7b88669854ea52ece966e28eb380b7e47261b22bceda3c777ed7b5d08dc7d8ee204195ab87a1a47aea588ce50de5abc5ee3d21e9af56c3d50861e676ca665076fd45ac6c84858f8b5f9bf19094cf37def59f153173f9f7a6f5d77bb1ebd0865649f014de33753cfbf0ecba7c7a511708b823300b6237fd981721be2529575333ef3a0c2dce4c4c25c4b7e1f1ceba3b53baad699ac56e2c0687fbb9f943c8b817f694840829083655ceca55213e3ca3f7b2478238cbf3f5b6225ad615d22a6d42ecaa52aab75c1d8bb1ac112742b76f7ad4d0a85edd7338cb665076fd4533c866ffb36a46eba23eb8fcbbcd7888a830f4d4655fb9aea6f5b70ab1eb0b139b10739573bceb78f621765d3fc1a80f04dc109805b19b75ceeadbcc23665aaddf38133b8ac71fb931a7bb5aa65decc68290856814f1fc200e4d0e077dfe3052da159ff9cbe1ce7c3914d4691d8667b734333aabb88ec5585ae7130fcb0b5ba16b726447d90ccaaebf6832fcd7e27fdefe489ef379c5fa9710cf368e7f7aae7f637977588d47733fb78b5134adbf55885d5b26ba1fb4d2ec98f481f7eb1a9de34d0a21f1753cfb10bb2e9e5ad40102ee094cbfd86541737999be2f379de755f22a17b8e390d9cbf993b4ba78dfb08b36caa86316c4ae0eb7def0a345b23757b2601d1d157544420cf7f1b2607eb7cbdee2da2f88ddda4d50d8813a1663e39d8a179cd1d95312e2696167150a982c82cb665076fd0a583854bbb4243c2aedbb2eb3d6ee72a8fb3dc37a4fcec4fc27ff7dfc3fa9bf8926757254c20fc73bfb59f736adbfa3719439772d99a4262fd3b1ddda42e73b9bf78e4a5e8032f9658d1562576716a02c085447a0b162f7ba578e0ec2c1ce7616b65ebb7390e9c59dbc6922bc380943e6a4434442ec99841e679ee3ebe19143231cb32e7687f3eb629564b09c91ad3be72915af49447b14cc6dbb8a10d07d2540ecea12abbe7c1d8b311e258bdc793a7f20247d67ec5999c065e2d5e52aca665076fd2ab3c6265c5327b3b54a5f5c94b1152aa67325adef5f2d761ff33cce13d04deb6f2562d7526cdaecbfb6daab1b9f6c46bb3f0c763a4573b98e671f62b7c82af83b08d443a09162377dbfa5784dada097262e7a8b2bbdd4445469ccc7b230a7eeb735d86b9b73beeb976587ce9a4eab5915bb71a831c5fb6b5d1d4ff4868836abb633c4aee9ccafeebe2a1763b11797ce56442456a4a007ae446e42eb241097f7bf3ffedf435d7a653328bb7e95f15a26fe32669bd737ee1349faae252e9fe8daedebc5ffb813c9167bab8d2f162ce762fea1a98797fb70295b2f04d10a7722efa340d3fa5b85d875c14465dfece40449f60bff68f3fe51fd0054c7b30fb16bfc4ac08d20502a81668add76273de9d410d52b6ab5d6c7456fee11431378c7438b7bedcefbd46364341358658a6d491be1bb7eaf540b1b563e6b6237fe8022689b047d6c882cff36cebc2c69b5ac8454938d43ec966245a7959a2ec638d10f0951788ead88e49d48d01d41748786ffcab92cf6969a32f0d9bb9306d9229499abdb0fc4e5435d519ad60f1639326a3d1d3bfbd72824d566513fd6af4329e8b9ea99cc7c1f8bf420a2c737ce2e2ec8cedbb4fef258cb7e369c3091b47516cc3f29fa6831fcd876f198a4e468129b4b390cbe6c7e6983b061ea63f6751b43e15e10f0894053c56efa7142d7c9c61e356a9d6ff3d12e3947008ddff5261cf48721cbc3e35bd2c56efc57f6249f3d52393626d9eff9738ae1afb5e7d3c49839b1bbd0392a4de88e0cebf048aba2b902b15b44a8febf9b2ec6eaeff9871e08492fc3773b4f4cfb64caa069623709b7e52460a6d78914f44c47188e37c41e3519c9073744221732384ec632a3ef24834392722b08825da28bc371511f7bc549dea188ee91101c9190f9d1266f1f67d3facb80ca7e361c32391192b6642077038af647f66381fb6f74712f8aa29522db293f141a1fd6cae607b1ab6c35140481da093453ec2e76d749ca6f34e871e66516ae45a1a9afc2417f989d772876f33cc85ce494246df2bf228f5d86f8205f9354cd92d8cdf918a131c5148b8e85c92bde61540c62d7085ba537992ec62aed647e63fb6762be53e4d5c9abc29441d3c4ae75f6d90f1063af7e40175b799ede89b0750ef5cdf7ec2b64b79db4a38d17ab8c395c14dedab4fe96fd6cb00d7c6352302f94bdba557c2c80d82de329469d20500e81668add6186634e4855245ef5a84d26a71ab6c35ee4df1656c461aa823833eff56cbcf22a736f7a5f3d4d523553627778e6eedf0a6cfc9624ed51208f28224e78f6e10ae82e459ca999382a207fae383cd62aafbf10bb854f6ced054c17b3b5777cd8016ba15bc582d494b1aa98d6b18503efee64732792e846166231cc94ac7ba48bf6de60cbbdc83ae894ca16451934adbf55cc5ddf98e419bae863c6e4bd55f073f9010861cc4a8f390a81801181468addd14893bdb0eba9fb6a4d70a4249f4a8e0e5213bc266d127999a46a96c42e9b2d75bcfc012390a14e56e5ab2cce91e8a584455716b60eb16bf630567997e962acca3e66b4e544e8ce9ad8e5f17aee49d3b6ebdae2ef9f3ad887e96a4a9f6c0c767e9d575993fa6bfa7ed0fd50e3199354f3e98ea98a774b5a476d9e6f885d57af01d403023709345aecc62285bdafd1473d9292133dfdcacac81999964b15bc9e26a99a39b1fb611e2d1389f724a3d0f6ccdc383c9ac42a09ba1b7bfc83b350658fb7d51c4e6e86d87541b1dc3a4c17b3e5f6aaa076c58434aa7d3465a0baf82dbb7ed5718eca390c67d66d5aa97c9177d4f5025fa9533a8514c2b16d04894e5794cae6f4b7cab9bbb6d0fd918659da7dbc0ecfc4fc7ddded1255f21b41b3995b10bb3e4e3df4695a08345eec8e0c3114bd738f480ade735b1c769c66c1826385528f22b29f096fc341ffae7d356e6b9835b1eb965efdb541ecd66f83a21e982ec68aea2dedef1ac96154fb60caa0a96297b924a1a37d83506355ac56e502213adf1fffb4ab5a4922e0793c1c3e5deba522d69bd2dfb29f8d7143f9c46462027162b6ce0fc73b37c2f58b265a95fc20768bac81bf8340bd04a646ec8e638c8f916989559272554bf82a785993638c3874fa0b07a67b4b426e86c7bba183ba9c55919c35fba7b40a7d4da8e56cf0535211c4aeff86345d8c553d32169634cc04acbde02ceaab2983268b5daf05afe1070d8fc4d2e1c660e793a279d784fe96fd6c4c32f288c9a86bc642972ba89a5ffc5cb7bbfdd1d9cf457370f2eff0ecea124379105027307562f76acfa4998757d9cb6ae4498e9358890312d19ece3e507573da978c3f1404c47b945343c22176ed19575103c46e1594edda305d8cd9b5aa75b7f639a85ab557b0203565ac2aa675c73b5ede330fef4920c4431d8f6eaa588ace5fd41d0e1b88cb4f54ce248ec59dc7fdad6beef616ba2f528fa8b299ecfaf76aef1f9f6ca20e7e10bbfa86c61d20500581a911bb8937924398ed32346b6647ee2d744212b49662ac5744629b64c4471e91edfecf2a264391d08dc731e00f97b87c2700b1ebbb85cc3d0f158cac74913b1a43d90bd2b2ebb7b5c5d78bff71e752b65e987a836cdbe7fb39f4f7ff05f3cf74f74466b55d63c2a31312f2c9c6717f4b878baffdad73ee264c9ed6126a2fe5f3b3e0a3e7b6f3b10e7e10bb3a4f1eca824075041a2f767bed2e872bb3e0fcd811b66b67ed16d599b5b79588de10d16638e8f359bdde5f2a421762d77b335e751062d77f5b992ec64a1ad98990b41505f4b28c70e54c61d4ee4a93f1a87a5e4d19abd66fd2f7b47bea10173cc69610cf6dbcb959e367af3549faae2a116f2bd87dec6fdd73973fc4c8a8f5b42a2fafebf958073f885d576f44d403026e093456ec261992dd9fb54b741a0efab7543167888af1dbdf72a6689f3dbb09cb23956cd6f0ecaace8c7acb41ecd6cb5fa575d3c5984add2a6578712984d8952477ab14b8e37d3365a02a46cbae5f85b36a9938ac962e1e9394a57ad458188a406c95217227c7faf5e2ef572ea57c5a96e81d8ee5f2b94ad8b28a1d7ceaaf2f73b76cd1eb5ae48eec5c073f885d95a70c6540a07a028d14bbaa5ec81c9cec75e58bb320a7ed4d553afb36e9c7df94cc266983e6ced7ab3a7a46a94fa3a39b2ee795cf112e5bec264cf9a89e25926c1f798b242d1578eedf12d1fbf8c820410724e980227914feb37fa0ca61daca41ecfa6f51d3c598e2c84e24d155422916b5c3fba2c380a27d57e240b12f99c54c194ca3d81d87f4d562f7b18868c5d1fed71392b42b03da3da7f92ddbf050139bc7fb9323f98084e0e36dee98d471758fa42d0ac4fe19cdbd2c6b2c3ef4b7ec6743d706a38f3152ca15071f2ff649cadd20885e96f52eaa831fc4aeeeac427910a88640e3c46e5ea6e07c64e28fd43adb1b179b39fb6ddf8483fe729109b4fbc209aa24adfa22c24cce0f76297687ed7fb44c522ec767d1daeeb74e37d89b58fcf239b713f62fb26f93ff0eb1db64eba1ef20f081007b1b233ed62792f7a4a0db6278c4cfed14468792e890ff7be2b13f21a2fdbabcf659368c43868958fcde9142dc13c3b14c1e5b74f5b14648b94f41701210ed57e18d9eec77d3fa5bc5b3c3c2f7dfe8e21ecf4bb66324e88e187ec498fc9011db51483ae10f14be7d6cab8215da000110a89f40a3c46e6f61659984f8d910db0d6f6d728cd03f52eb6bb57e131efd85437b33af1cb15cd44525cf715125b67fefb53bbc9f58eb08255bb16b7c2c94ed603fdcff8684dcf6351bb6ab6142ecba22897a4000044000044000044000049a4aa03162573174f94d1cca4af2f39b0611afc3c10e9fbb7bedeab53b1ceafadb1be555cedc6d7738fcd72cfbb3905fd779beae82503f4d0bf13611bbb1ed0471a6ec558789c4ec9f39f6b40762938260b3e8c3867d63d5d600b15b2d6fb4060220000220000220000220e01f8146885d05a17b4a42aeb378ccd9479b9a782a331459d22fe1bbfe529ec97aed0e1f2b7473cfaf94bf23129b0ac24e2bf3b3abe953187e2de4d724057f18b821e455c5aed139c4ae0668560feffb0da975beeddbbe6a93e140ec9a50c33d200002200002200002200002d344c07bb1abb0aff494225a1edf079b294249fc311cec7006e7ab2b3f13f1cdf2a31b7342a0df86833eef3fa5de62779da4fca660c2542a7815926ac5fdc93a52a948ec265cd675c3a3151faa2411d55569ce9a7dd32baf58594631f6686f53abb5de646f2fc4aedd24c0dd200002200002200002200002cd27e0bfd8cd0f15be2174639199b9173533943963ef6a7af9611bdd5522f9e79b53e0fa3d0ae1c244158534171f31f4a1efba623711d1a17158f707902c680f48c8038ae880e6e68e5444e730545adea220e08457ec91e70f0eb642f85553452fc46ef35fce18010880000880000880000880801d01afc56ea1508ce8d3b4ccc6d94294885ae7b727c35473bd9d1989aa32bdb6427c1b1eefb06733be7aedee76fa1ee26b863ba556ebae8aa8b3317796804dea7c4badf3e5111b1db19b787379ef73da314e455d7e4b426c5314edb93e8b7822db3367d73611bfa7d43a5f6a5a6833c46ed1b4c3df410004400004400004400004a69d80b762b7705f29516e46e3de42e72875cf6c8617353351d58478fd206233925349f9bb71d19659efcd99a574dc91e9842c08a9be21e8b4c4ae5ab8f658d7c56b22b95df5fed844942f13f17ee4b4246619742bf2bc9bda36ed3e885d9734511708800008800008800008804013097829760bf7956608d07103647a8533124fe926aacadc173ce139ce101d5973a59423890a8f6c4af190972076df10d166d502370bb456022d85f9e6dbc30fb1eb9b45d01f100001100001100001100081aa097827768bf795925242a7dc337427bcaf0c3db7dd496fedd21f96e8f2f2e6f9bc1342ba50644e5a9b8fc2993bbfeb3264361ed7c5fc416666e86c4f77eab14a6909aa0ac7a9708c53d513ffda8791a223a432c2e5ebec7351db10bb4584f0771000011000011000011000816927e09fd8cd171ed7f69516192727843855306727b6ba2eb09593536587f77212a6f4fda38ebd88057b86333f1ce87876e38f059949c1aeac548ad7ba680e14fdbdb7b8d22329becf2cd7c010e6c41e32654cd6a1f299fbbe533e2015b1c7df41000440000440000440000440a04c025e89dd828454da499c72f7fda6249eca4f54f521b1957a72aa8c7dbd445f12d1a3ccccc51949b17427426ea2ae022fb2aed85513bcd94739e98ecd4579857de14a51042efae2ba0e78765d13457d2000022000022000022000024d23e08dd8cd15664cd5d073947de66e7a387476a22af97578bccb47ebb0173335c477b28f99fb755baddfd0f9e52d0ae86f1913c65a641586831784e69a88dd840d6765ceca7a9c7a54541d0f4d61e835a985cbd7d177953621765528a10c0880000880000880000880c03413f042ec161e5d63114a9a938538f548991c6fdfdb70d0e7b35b59ecbe4f3d66672c3955a6781fdbd79bebc93614f7a3c99a1b56ac102a6d2c76798ff0e53c7f0cf056f0261e7cee63d651495ae1f23ebe2020767db40afa040220000220000220000220502581dac56ee281cc1347565ecea4fe9354a829a22fd7231ad1a734df7aaf969caa1392a0b59476afc653e07d35de5f59e0b554aad754ecc61f038682f7c8a5988cc7947649f13eedace5ac87a8f0c30a51e3856ef241067b76ab7c93a22d100001100001100001100001ef08d42f76f3131b39111eb95eceb4bdbbd97d7a4524b689e49f6f5a52bc0e073bab579ed5ac737ee9fabed5dcf36f0dbdbb99670c1329ef7bb611bbb1d8faf7ce5d0ac8c87b1adfdb12ab24e92e4979373393f4b811780fb2100724a23dba147b690258e1c38a321fef9ee4890ec1b3ebbb85d03f100001100001100001100081b209d42a760b120439dbdf997b0c51cadecc1ccfe82949da4cf5d88e798955135d150ae38c3381f32645ae7856085fbeea53c6bee4b4a387b2fa53785e327df84090847df3c702fe97155eacf33c9c12d1367f9c08073bdb4a4237a2651d2fb14e67aa2e0bb15b3571b4070220000220000220000220e01b81dac46eb1e7cf6de6de5cef6edab9bb999ed90c138ed591bd17f7baf7774c587266e63f65d4ac7c644f41acc3b4af000020004944415488eed59e63954968ebd9551c1b177b4344bc17da85c04d1f5aecf5250eabfe2c73ec865e741596759481d8ad833ada040110000110000110000110f089402d6297e62e0e72931849da08dff57b2e41e90ac1c2f357273b772d395546022ba24ce19a99055ac3bbab2be8f3f8ba12bbdc86c2113f2e4d6d5297f2070593caebb80762b70eea68130440000440000440000440c02702f5885d21d893f94506082d0fa40eccfc10df0f470bc5026d9864293db1d564a3e31996db9d6c2fed98209eac2237a9944236ea829061ed245f2ec56e227837736cae6346b76515d8ba6db09ada2076abe18c56400004400004400004400004fc2550bdd8257a95237a4a4d10140bd88bf9838c844737dacef5945eb3e9f8ded38c337815ce6dcd3cbf374e2c75be141eedf19147a997cdbd6915ba16bb968297f7dff2f9bd47240487230f2f29978888ff9986416b7f04f0f751bede3388dda6580afd040110000110000110000110288b401d6237672c6ef7e9a68bb8ee6a7a36e5b8f4b563790a8ef0f9507d92f829d7bbaab02734dfbb2bbe0d8f77d653c7c4c7f208f1732a588da454e3f797217613c1cba235eb0cde511792e452b447add65e78f4970f023763f62461ea7c3c11ff53497235b54237e18ca387ca7a6ba25e1000011000011000011000814610f047ec96b04f37cb02395e50a2097198738ccf87ea13219be909d6da77dbe5a38d3e4fe97ba67737733c1aed4eb6579ad81d8687a79dab7c2d7bb2edd33396dd392d5cdec99156b67d2cf37e7876cba48bba4100044000044000044000049a40c017b15bda3edd34231424ab221a3b0b57295155ebfc36d1bfdda2cbcb7f64185d390152ee3149295eda02efb372bb55895d6e27d90f1d261e580e4ddea6e02ccc0bd3367d98e2b6a28f7a14c94724e8567c1c51ebbc57465ba67d2ce33e88dd32a8a24e1000011000011000011000812611f041ec6aedd3bd122f5272b8ea1145149a9c8daa7ac66f61a2aac47b9ab3bfb770bf6d8ad0cc4ae674a3ae32bcbab1207570ceaecb07210e111792c5eaf56b6eee4825ccd9655f9a5017c46e13ac843e8200088000088000088000089449c003b1abb74f3745846989e57198bd7666c830173ba588965948e727aa12af4946a1cb3db3b9deddb144576579757d10bb7118327fd01071f2a9ecf3713f18f40d494e6225b7c377bb1c263dd317c4ee4c9b1f83070110000110000110000110e078ddca17c5d7b16b2509ea2d744212b476c37286fb7d13af6ddafed15113f1de4eba98bb9b2766494a4e8894967449dbab3b6a385760b75abf616f66595eddbac46e22def9e826950453790ff070ffafa1d77f1ade0c953fd70a09d8a6812bc6000220000220000220000220d01c02758a5dad244149c2a13f67a035def39b645066c1fbab8cba630f2f09da4e3fb248bcce48287523d995ceb428f2ee92949b99029cc878afee98d86626373caae1a02f74c6a15236b12d679a2ecad2ac52dd64993724e5faac797b21764da60aee0101100001100001100001109826027589ddab106115980a8294a8757edb34e9508190e62e9e1289bd4c519b360849bfd0dcf95d953e5ded4795e2fdf8fee3de62779da4fc2683d19bd4f05e8b0ccce3ed54b56757f978279589925766c63c8f10bbb61306f7830008800008800008800008349d403d6257c8afc3e35dcec65b7829841a2775e8edfd9d6cb8206155613f6f1628ee4fe2bde564541f3ca863199793b1f319b3595ee7b47e597b75b9d2cac46efebe6903ee99b76885ccbb6cb88eba2076eba08e364100044000044000044000047c225083d815afc3c10eefc954ba0a92487da8c370dfee7827dc09dee231e67a6d23fa74e4e12df0ee5e67e8c8ab5badd8eda4864ba74c8eb744744042b0f81f5e929357c925b5f0e7629b284dc8861482d86d88a1d04d100001100001100001100081d208542f7635c24995ceb8fd80c678dfae63c19b9b1d3a09db65af76f6fed431465adedd9473784d674e659eddc5951e49f17d4a3f8749a6486c87839dedbc710c197db44c14270acb4a6ee5c4e36dcab3eafb2076ab268ef64000044000044000044000047c23e0add835dacb69b16f3745f0b220d5091f4eaa480f5f8e05d9c5fc7a6a36e9c95931e6d9e53f297b771d8d3f6eb3c2737627b26cf35ee4cd70d0e7f06ea32bf1d0f7920f0aa72444181eef7002ac99b9207667c6d4182808800008800008800008804006012fc5ae9637f3dac08af7c9aace8461d2a8ac0ccc99b5a4ee0b4d1260b1785311cf37ea50e4e1744f6a956257d52628a74e0062579d154a8200088000088000088000084c27013fc56ebb739013e6fb8684d84bcd52ec60dfeeb89993f0d84dc52ccc37c2a853135065cf230edbed6579340bbdbb13de60dbe90ab16b4bb0defb2176ebe58fd6410004400004400004400004ea27e09dd8edb53bec01fd22154d729c0f5dccddcd3863d6c9beddc9b663cfac9461fa39bb71e91b670627e294436995bcb9d43aefe51d5354e0dd753e6e88ddfa1f4e9b1e40ecdad0c3bd200002200002200002200002d340c02bb15b980d793c4b71bb23530de070dfea78fd399ed56b09a992338159b06727a01a55cce29de4a3f0dd2e67242ebc7aedcefb0cf1ec3cf912c46ea139bc2e00b1ebb579d0391000011000011000011000810a087823761391c8a22fcb137a4dd06589312277fb76d5c4eeb03dad04545cb110df527016e67973afb5cfde65927f4e9913a7d43a5f52ad47754e41ecaa92f2b31cc4ae9f7641af400004400004400004400004aa23e085d84d84e2414e98f0cda44d8bddf52af6ed8e4c91e3d97d45447b2489332d7fac60ba3714516f748eae42f9b848ce79c34e13535d8db7c26cccaa0cea28374c54266f51c067fa06b772fb20e511c5ffc47b5dfbba1e1bc4ae6ba2a80f0440000440000440000440a06904fc10bb19c22a8199ba1f35e76822f7fb5717569689c4a6a298cd9a03a724e47a78bccb471a695dc97edd93d49b34ce2dd66974163dbbf19c62512b033eb3774929143d1fea5b22714422daa3880e54c3d575ec94551662d70545d4010220000220000220000220d06402b58bdd822cc3d7f6c34e82ce58d01339dab79b8456b338fdcccec8e235b5ce1e99861a67ee6596f44bf8aecfa2ccf9350b6237b66f4b70f2b1657b1b2b9b60984dfc526e97e9fd85d855b6070a8200088000088000088000084c29815ac56e72fe6cda3ed421ee02af6599fb767b8b2b3d92625d319b72faf4d04c409535c77a0b9da354afb2e3a396c6db9f56b19bccb95592b46ce9a9b77f25c4f383cf72167bbcefdbbec20f3540ecbaa489ba4000044000044000044000049a48a036b15b98904ac8af8b427e33bdc2162250f36cdd3c9bbf2a3a4e4865c2e4846b13b55abf098ffe72a4528f6e996912bbc37db7f48888566b17b8598618095f499b2e3cbe10bbba331ee5410004400004400004400004a68d402d6297e62e0ee8729e332f671ccf235e87839dd522d8aef7ed267b6373fa55d4a36b7f7792382adb7b4d6fc2419fc36f4bb9a641ec26e1df7cd671f13150a55034aef42d1185e1a0cf4758195d10bb46d870130880000880000880000880c01411a847ec0ac15eb62f3238bea5d6f9b2eafe5657fb763584ee1b221152eb6c8f2e3fe244462c48d28f4bb2dc3b5cb09fd9f9d9bae3f668aad88ded187dd4232959e4661d63a5f308b3bddf93a083f8a6284a3f1339e0a4561c7acf599b25676db6dce71dd7764a42843a47548d0606b1ab636294050110000110000110008174025f2d76ef89483e9042dc13442b49a91349b42f84d80de862ebfbe3ff3d043f3f09542f7649bc26929f67e038a5889675c2385deddbcd39da67d4d55322f168726f654138b691204d3cd69c182bdd23596262aa31b1c4a2ee86600b077de1e754262a0c8d2feef85b92b4170b5bce9efccffe50e01a5e497feec60258108b61530fb3c9732153ba6d1d0d90f9bc959415dc103d6e03011000816b0478b1da22713b22ba77134d741850707249f2e487e39d7da0030110000126f05f8bff79fba3e8fc05097a50484488671bc73f3d2f2c87029513a841ece68d51fc5137518f8b7dbbb9fb6287dd7d43adf3d52c6f73de19bce1a0cf5e6ca5abb7f48725ba8cc29c8f01a37a8c44b4522792424df4ec6626f2ca1e387fc0d82392dbd46aed95b5ff79d4fcd0be977c8cd52a519c015addf3acf981039e5d9dd98eb2200002d346205ea4d2c56329e5ca9827467598fb42d27e14d0fe0fc73b2f556f4239100081e92110bf43e4f95f89e88ef2a8246d6dbcdb79a85c1e052b21e08fd8354c2ae562df6eafdde150e4f4b06a21be0d8f77382b73e69578f0fe965240c993968c212fb47bbc6ae7e708a70dac9162b7dd49f366a60def1591d8d6fdb0e2fa89bcca0c9d1dd27fad491daf3ac4ae6b6b4d5f7d6bedaeeaf3726df09268f787c14e67fa88543722b02f8ff5d78bff714746ada752d06317ad044274be3ffe69d7455da803049a44606da1f31d09f154a3cffb6762bef3dfc7ff73a2718fb745bf6a7739947114b2acde4f7878d5595554d217b1ab240ab398d8eedbcd0ccd5410badca764bf6fdac39d39aed8cb175dac928cf72fab87b756142eda50b1fbbec05bfa25b5ceb755f78357f40c8ee60f2764fb534e9ba7e1a0cf7b81952e885d254c335d0882ab3ef3837d39ecd7167fff94a4e4c5f96d572d4841f711daec8a26ea690a01fe6814c9d6df75fa3b4dcfca578bddc742d20b9df18f953d09c4e57dece135a457c26d3e88dd536a9d2fd90810db7dbbb6c22ec9fa9b2254ae67958e3db89cc8484a1636ea02f7caf06a59aa5dcc135b262efaa05b47b61d929a0ca30774fb61523e37ba6058a156e83ac4ae891566eb1e08aefaec0df6eed9f716ba2f5c7973c77bb731d8f1364f857b8aa811048604d616ba3f2aed531d019b326fa6edfb440a7a822d10fe3c4df58bdd883eb54e04b4d85d2729bfb9815551dce41cef53283012af2e9f759bb6fff21509714432de9f699b9df7945aadbb65ef2b1d316ca2d8e5bef7163a21095acb79c40a6d5af5e359864887d8adda8acd6b0f82ab3e9b81bd5bf6b60bd3bcde40ecbab5156af39fc0d78bbf5f89a4ecabf6741ab7b6acb5bbecd556dfab3b014b487a19bedb79a2ca10e5ca2550b7d875223c72c482527874a6402a480a94241cda36f3d26a1a56c8afc3e35dced05cc9d554b11b0bdebc3dd8437a4ee69d0b43140a5d22a3f39a21765d5867baeb80e0aacfbe60ef8efdda62e70149f1a3bb1aafd704b15b1659d4eb2b01cdbdaa276762fe9369d9a73bb289e93b7a74ff347e00f075beaaf4ab4eb16bb4884f1b544e165ea53672b3316788cc24b950f619bb2af4d5cb288976f5ea8a4b3659ec268237f5e8a464e4da47f91413d32f9193d86c5499b1dd2176f5ed316b7798fe98e347dc7ea680bd3d43ae21c996ca1e18677b74277ab6bf31d8b9efa6b7a80504fc27a0bd5755c8871bc7fdadb246c65e6693ba6d8f115b6b77ff65f55e41566613b395764f5d62f72db5ce976df6e98e88e47ac6349239e584325f134689c8ed39084b5635aaf59e66d586c6cb355eec2e2ddfa2cb7916bc597ba36b15bc0a67025b3d2310bb26b37eb6ee81e0aacfde60ef867d9290ea3b37b5ddac051f76ca228b7a7d25a015be2be5f38d77fd67658ea5ae77a5a677fb268229dbc35ca68daba8bb0eb1eb74ef69afdd39c810345a5e3185b376df9610aefc8648bccf3f5757ffec611713a7e9629719c4fba92fe60f48d0c7a94c24fd4273e777f33eba5c9d8d2bc41249ba4b24392332ff1b89689e17ef633b0a3a20298f8aceec75d1af221b43ec1611c2dfeb5a44803c11d8bb99056bed2e9f8179cf4d6d10bb657144bdcd20a0f9f1e8f04cccdf2f3b7cb9ae77a5268b1b069ea6ccd4cd98bdf9bdac41ecba136fb90255c3ab3b4294e3dd7565ebb724698f84d8a3d6d91e9dcf2f5140ec7d4c4b6e45a49860cb55e7c6eb9906b11b0bde7fefdccd654c74cd839a241ce36cd9cb2469395328174167212d62dbee8d1f7794d45fbac71962b7c840f87b5d8b089087d87531074c8e46d16d1749667489a17c5309e86e09a84accd5f53b95f0e08f69fa49aa10c2ecdd6350bdd83510a159d472c4a99657f74aecf2d9b79797ec294e179ffae6bb266ec73d8885de3d22a331e87731fd8e6911bb8a82973dec9cfceb51be97dd86ae784d449b44322f04de596835c4ae8dad66e3deba1611b341377f94606f3f0bb4f716de6cf28484781ed0c5d6f87998bc47f092e41d11c93b321087383ec4de56a8c17f026b0b9def48083ea3baf8aa3044b7ce77e5578bdd7b42120b5e9dab128fb74e875096a8b16237092ffd4786118db3ed2a78028be74d41e6e442ef9e42786d7127ec4a4c93d88d056fbbf3888852ce42b6e3e4f86ee3793bd90f885dc79699c2eaea5c444c214ead2181bd16aed4c25a8bf39b3560416a6f02d430250474a224aadec75ef7bb32398689b3bdab24c1db0fc4e5c3f18f675332451a3f8ce68addace3650a8e0b52b1582c78056d5b85b066ec052d14ba44cebc7b2a63cd2a336d62b70182d799d04dc62a536c6b1d2d90194de13062c366dee25e7502752f22d47b3a7d25c1dedea6360964a4a027f0d8dadb00354c0781b585ee8f24e881c2684e027179bf4a31e7c3bb320e69a68bc7242533ba9123803f0090a02dbc531466504d451a297613c17892caccd179b4711bd1dc239282f76f7e66609fd46cbabd76773b3754d613d1308d623716810b9d9004ad19d8b3bc5b4ad89b0dcf6e79e69a969a7d58444c0b4bdd7180bd2eb19be56dc42ececeb5e78f1aa68340e2b9ec2b8da6e46386d2fae0e3bb72741c92edf1464acc51c80981668addc5ee3a49f94d0a81d28ee9e965b7996308f13a1cecb0588eaf5e9637fa430d4ebd7b3633645ac5aea21dc6d19d12893d12d11e457440737347e1d15f8ec60bc421f517179c6cec2ec96099482e6becfb563a0b5ad79610bbbac466afbc8f8b8859b102d8db5bdaf41cccaac330ed478a1a40a03c02bc2fb54542254497be3ffe69b7bc9ea4d78c7765d5c4a7b3bd668add85ce516a8871091eb22ba19a257685f836437827b78ad7d43a7b4497f39c00e98bcc69e4c823ed6a9a4eb3d84d042f67444ef7d8f39e69a26d92b419feb3cf09cbb4af24149ef709afe684c35b871567750c6257db643377031611f5991cecedd983a13d43d40002be13c073eebb859ad1bfc689dddc4443add66f26bd6eaecc90e9d995f277438f9ef83ea7add3024f5f29de3d9bb14fbdd8e530f5cbf9892380c46b925118bedbe5ffeeeceab5bbecdd9fccf49c1ae6eeaa51885d5724a7b71e2c22eab32dd8dbb307437b86a801047c2780e7dc770b35a37f4d14bb191eb9eb21c3aef1e7895d16470a21ca595df24ee87247a75dec8e8c119fd5cc574a78b2f339340a772622d7827ab2af10bbaead377df56111519f4dc1de9e3d18da33440d20e03b013ce7be5ba819fd6b94d8cd3d6ea8e4c44e45623711889bb9a1ca37e78497427796c4aeca631a0be22058262997886889242d5d852673c8b320dec37b44421c5114ed952d6495fadcee201bb30aa8869489cffb23b14251745b0a714f0c8f4118cf0a7928890e0349877c36a824b9fbc3f1ce7edef07c5e44c4476150708f28b823a55ce17188e178c7f7969d48a27d21e98402b11f10edff5f9adbffefe3ff494f5ee891ad7d66af8269689fb90714c97b24e8ce648652de173b6e9732f6fa3589619c0488e76ff2fc26f3399ed763d7be243a69e27c4e9b33a377163fbf13cfeef0b9156277f28c6395b9675a6662cef2bb84e7ede88adf9f42ca7d0a68ff8c3edab5798f8cdae2b39a23417752de5d435bc70c68bf8ce7a388d3d03ef20ebf6347fd4ce6e5e46f0bc5d986f91d9cbc6b89a24349f119d4b9bf31457d50f97b939e7395f1b82833cc0e7db6c2b6e377b014745b0ce7f38d393db41bcfebe0a4eab9e6d31c6b96d82df1b8a1a209a822761391a82a78bd15bab32e76936cdfab449c895b2bd9d4681a0d935a91dca6d6f97678b4f7be687eb9fe3b3cbbae89565f5fbc608a82c724041f7730fe23a6da994312e2e519cdbd4c5bb8f9b688181b2f8b801bc73ba80e9a246dc98076cf697ecb66c1aadc9e41c1aad8bb6e8745dba5944f05d1a4502ba2903b17f36eb6c9ba5cd4a9dcbf0bf16ce3f8a7e72675f062749ece1f888856148f74c96b669f84d82a5318ba9c27bcc02549df29cd9114c62efbc2500de72c7f74d812c1e5739d6376be5aec3e16929e1abcaf4f4888e759ef6a93393879cfc4c707dde737ab0b8742d2ae0ce4eec6717fcbb49f6b8bbf7f4a527e677abfcd7d7909eb5ccf459b7e5e7dacc938fe48a7eef86364091f9b7c9e638d11bb8900610fdaaf528c5a7a166365b1cb67f406f4b7c289172741928f7cf002a6f57556c298c7c79e440eacc749a5d2e759a159530af07eed6d6ab5d6cbda4f9e613f78764dace5c13dfca326a3d65329e8b1b3ee08f16c7221e5cb0fb9e16254054de90b48954ea495a98abdab76624f4274fec281708b6da223229b2476c79e5dfe40a594e1566b0e49da0a02f1d2b527d0d53cd1162d258adde19c3d7b4a42b0f834bf143e7ac48b7c492fac3ed20d7b7842423eb1118ee3035d5bec3c10915891c33374ddcfc7eb540fa5a0e72667cd6acf1b736bdeb8d377b1cb732b88e8b1d3f5c01805db33829b32c79a2376db1dce6cfba75431d13a5f2adb7ba62276878988247b76d30479fae3296983e6ced7cbeebfeebb61d6c46e6ee2335d78d9e54bff28336a1a9e5d7746abb2a6e4479f1767652c4c0e03219e8c16caae16b8a67cb43c40a68d240b4829e899c922ccaed9ecbbab62efa29d6421ffa381b72a138090f4327cb7f344856f13c42e0babff139d7f57d682749253b240e539ed248cd4c53ce92d745f688fbf24b1eb507cc6e8f3e66be2cd65a1ebecd2793e261b1df300f2c752938820db71ec4b414f74e626c4ee4de455bf5388b7418dad0ff2264113e75893c42e1f01f3db140354120e5c24767b8b2bbd828ccc797387bd7fbd70d067a1ecc5354b62b7206ac0a53d4a3b077ab29310bb2ecd567e5d71d8a33cff5129f4cfb23bc942e4a58b05ae69576a59dc48da3a0be69ff810da5c157bdb7612d1d02fe3e38bea79b7be8b5df66c90142c76caf84095ff8829781d559e5107f384c377f5059f900f27bd980efac25e56f77356cae71beffacfc679962174afea4f69afc8966b0b9defac3dd9458da8fe5d636ed6f27b908cc347cf6eadef948279d7d439d608b19b9b982aa24f4dcf42557d66b95ca6d825f14722c961afd967e8aa37f486a45cf721b479a6c42e27a012e267753359942c3991daa86710bb1636aaf8d638dc4e9ef3e2cc7c9faa669f59f01a2d4e89e264253f0c763a9a4dc6c51d86c39a34cff7ec07e2f2a1ce3e3cd386f2eeb35dd0abf6c9a69d7331ffb0f479a9b0a0f759ec1a7933558da75e6eff4ccc776c3ee2d8cc1312f44c48faab7a773f940c84e84c8664dbf4a5f4393b26ce4b15ba2344291f0372df2b3e89dd028ff8f83820763fd0f0e09db2bf31d8b99f35cfbc12bb1a73ac196277a11392a0b514f86fc341ffaec94b56f79e6cb14b4567e872535f92a4bb196348ebca1b6ab51e55b9c773b2133325768767ee6667708df757d33609b147913c9afcb8d28bf7698b25927132abd5ab4ccd69966d9ddfae22641d6257f709afa77c1d42d776a4a662d7a3b19e04e2f27e9d82d76641aff3a1c1a69d38f3ea70af5fa9579ae0196fd047b15b652486227cde2ff9502774f49ad86877d3723c1437cdc9e08699608d121eb916bb15ccd9c38dc1ce2749c48391c02f867aadc4c99998ff44f543461c5e2a5b7fd76ca3dce20a1fb42076930fc1157ff44e357c8147bea973ac1962b7dde16cb6b524a61a4d861cb19bf7a238a5889647e26878a6abd8cc1543d76b7b45526ed6e1e99d25b1cbc87b373fa80c134b4514ea460e0cc52ff56e24ba92b411beebf37f2ffd82d82d1db19306d6da5d5e3055e6d175d16913b1eb91d01d21b0f686d9b0b411a155885ddebf55d57ebfa2f9e49bd8f5702e8fa6e28914d43111bca6f3d1769eb814bbb67d517d9e93a818de0f5bcd7b5b231c98c750dbf39207b0c0430db14be4cb5a400aba5ff40e69e21cf35eec26499ffe9cfa1c55e4258bc5d062779da4fc46f58548446f29a24737bc80ec45bc985fd7f0f27293958737cf9ad81d0adee43c5d8ade5370b169eb811dee05fe689904ddadfafc5d885d8d27b5a6a2be8503a96228122769f578f9e328696be3ddce43d571bb2c672a2e74d99bb6e372ac2a75e52db06a9b3b1922c38330c33ca4461f71ea9a276762fed7935ecbbafaa2324f6b2aa3e5ddad24bc5a1f44ee18665dec7af44e39d918ecfcbac8bc4d9c634d10bbdb44f2f314f89524a61ab5ab2976df50eb7c354f2c25debf90883e2b9a58577fe7705a41eb559cdd3a8b6257d90e0d2808b1ebb791f8b89d484adea7dbb84b5b70b93943f19024ed532086d967a3e8360961771e2fd7a3e93571652cd305bd367bd3f054570355ac2737db6dbbdb370d93556c3ebd585aa6603773d9aa5b85371b7cc4319d8f857d2928b031d8119345eaea8bed58cabc7f945450b58db576974399ebc8c49cddc59c70e65916bb3e09479d2ce04d9b635e8bdd244b6ec65e4af1c770b0b3adfaf0db944b1264715b69d9a0af57ad19aa1a7baea5e43dc91f6bf4b1f4b35b217635ace16151885d0f8d32d6255f42964c28e9082edbbd6ddc564b88e759e78a8e1d81f09dc958f85c4b9d3d71866ddcb8cd7441afc39e1b356dc7d53835ea89f742a695f7c5b39bec55e36d07d5675dd6001917d54d6c54d34711885d45c36a7ec050148f571f1003a2fd4b9227e3e1ab3cdf89e6ee441cae2d25efddb70ddbce7cd72af65711965eb13ab3317bf74ed1786f28dacc9b39e6b7d8cd3a5b57d22fe1bbfe92de94d62f1d8bdc287a4452f23ecba2b373ad8e0f4ace79654f6f513b9303794b44a16b6f2fc4aefe7cf1e90e885d9fac71bd2f657cc9e51f6c21e53e05c1f0e36024ef9188bfecdb2e506e80d4115c56424521b1c9a8735647e468b4e36a56998a501df60d13bb9415ca6c35876c0c36e1d975dc8f7d21695f0682f746c7910a52887b0e3dd85a1f714ce7a30d5ebe17625799a05278e9a8b69c2442fb24c49624b95bb42f73b2675ce7a56cbdb09aa31991348ac24919964ec13ac5aee377ca68d88772987361f8dd4b23795cdab6822c964d9b63be8bddbdd4305f4defa9cec4e7b2c37dc2f428237c3aadbad4fdb9daedf21ecfe8a31e45f291a6a7979b1a7a7b496cbbf07843ecea5acfaff210bb7ed963bc37aebcbab1c015f2e5e43995e36d8d793e9fbaf248a90a2eab506d83f0620bc1ab250c5ccc2c5371644f43a30000200049444154a1ca7ed447d37652c6784252be0c826077dccb1edb388a5648084ed863e5f13408d534ca20accb905958cde531981c262882cbe75999c0e3e45774f198a4b47f5e359e2187f344e7f1483de2c4615f0e498897e3c2ae8cf7e1d8804f4888e765b5a79238e8daefcc42f7c75136759e7751402f75056e9a31adf6976a7aa8b97dd3f960f29c4f8eb7ccb65dbd53e23e4bdaa2406e9dd147bb6999bb87ef95b3158ae81e09c15efa1b21ee26bcd61a34c7bc15bb559fad9b24c26291cbfff4bcabadd66f5c1f13147b7a2571222b9df0e6e1b33a3a2a47d2a66e26e1d1c30eb1abf39bed5f59885dff6cc23db20debbd1a95c64276b8588f8fa4f8d185a757f547d1f4abb56afd691636f69a6bf2b49d5d652ea2263eac1809c289f1159e4d9ccc6b9e5fe6fb04356d5015c3f8b9b5df37ac753490a38ccfca1f714c59e63d07c38f7162f75a9961c409479bdcc97ace9df445d2d65930ff24ebc81e8b0f635943ce4d0ce6a43d8d10d358242e761e8848ace47d5c317d8fd9ecd74cf3e6e7f5c3743ed8fc8e8cfa5366dbe342d1d40e7c6e7cf2917098cb42f1e2b921a5787ccdebabf9fe6dda1cf357ec2eaef4488aef536ce7ec6c5d2b817bbd636fa975be6c9bbd376d9e267de4306af54456d72bbaf2f852eb6c4fb58f10bb8a6f0d4f8b41ecfa691817199875bff08f93b0fa2a9f54a4b288b0398b2f10979fd89c816be8394ff53295358bca5c443916bb876762febeca399fb61f7254e6958bb1e9b663339793fe2a339c9c6fb6225bd55b6e3a1f539f0f219e9dd1dccbbc39c35ead4b92777e38de7939598783be2865a476e859536a8f050649c11f84cc2e033162d650f15dc61f1589a8e85c6d57f341f7394f1bb5e95c2c6adbc13b8574924965593479065ec41f9f148e1c2a9e19ee4ab89e63fe8add76e720352194905f87c7bbbcb7d5e8bada876b162a9cd7666982971b4d3cddeb469ee7ebbd7e4342ecf1513834777190257e21768da697373741ec7a638a6b1db1f922ce15a92e5eb346efc26354f443ce6d9beec152a9bbc8b2a63f923afb958afa50f4f7b21651ae168aa37ab417a663616d450c26ffae6bfbca185a6660b6594426cf2b27c532f3982b868d9ab29cb0a1f139bfe3f5d8f64567ce1a7e18bb36eccadaf348ec5a8935cd7198ce07ddf7499562d7f4f771d44717427754d768ebc4c6f14fcf75dfd96596773dc7bc14bbb921cc8621c36362f10b0b037132a8bc8ccca50adea1e8e5b35be739d49abdbdc5d9a18b061b1f67240e48107f5ce010e80392d17b22b19916421d0ef814085cbe1380d8f5cf42b69e2fde97e3e25c58db7ea82c228c17919a0ba1342b2702e15fda3340334c50bbfeb11baa5ac099b6937455dbdb6de9bdd26acf746c2af377427cb1d8344bf4e620f99925d3d42450ae3f8a70567329a8e3624fa8a95d87cb17dafd61b0d3517d366d4547a5ed397affabb2292a676c27cd77bc693bbab6a952ec5a466c18478a14d9d4b7bf9bda3eed48413fc5aec310666b91cb6230109b149c85ec05edb53b9b449427984b17bca309199fd52b8893593dd2de676c38ab21760dc1557c1bc46ec5c0159a33f5388eaab60def1defa24d3873d122c2586c1a84b865613712db9a8b300593671631fd112f62ef54c418f0b0fa1a9f919d37c7c646fb917518dacc65eeb7ab67d6262244c5f3683a1faf6c6330575cdb35ae4fb31fd6a1cc15b6a7336f6dde4daaf71acf19cd0f40a6edb8e05556dba6f50edf29a29375149faaed9a52ce9853ca1cf353ecb63be959983543987b8bdd75c56383266d3fdce71a519896e0c927c17b257ce30cd2d22cc196c6cc87d8d58055635188dd1ae167346de945d0f27a158ddec65b54b488b05a400af930a0e4f8a4a241e4fc3d9292cfddd5f2c6158dcba23b376e35fd11d7eda3693b368b2a9b367592d798b6a3c3d06a2e3bf4c459bd3b14049929cb64622b27c25279866cfaa2fb71c1f6e34c95ede9cc5b15cefc21e7dfe8e21eef9d1624ae32a98b48de8986c7d65dbbc430dbbad63b35ad1fbae3309d0fbaeda4f5b58cb6adde29444ed7012af3c4a68c4f73cc3bb19b84e90ecf8a9cbc144398638f6740ec81d509f33d25499bfc4f2583b18f8297718d85392f3bd8df7bc30410bb368f7e75f742ec56c75ab525abd0258505ab6a3f46e5caf821e7baad16e6ba837058dec5e248b53b65b19f6cdfb41dae4747788eb76b33cf75da341d9b8e9dade6b2c367d64694a9ecef3365c97657a95ff5b988df1fedae91c7de74ce36a53d9d799bc69b85c73c9d3f1011ad90a015dba3c2746c3a5e56771ca6f6d16da72ab16b15e1e5f09d626abfbcfb7c9e63fe895d3e7287e84f294095b230c747f61071022bd5e3835e999e4debabe01d6717677396729904b1f8d511ffa9731a62b78c5784fb3a2176dd33b5add146049411ba64da9fa245849540b0856c77ffc9c660e7d77655a8dd5dd502ceb41dde8369cac2745ee98a15d3b115cddf710bdacc65d7cf6c99e335ad3b66e578afbb455f8cbc5e4d694f67de8ecfe1e159d8f2f1e8cc5db5375479a574c7616a1fdd76aa12bb3ebd535c59b90973cc43b1dbdd26929fdf308210df86c73b9c8d38f352109fa37b4f4988908260d3f67c5c85362bdbc35b347193fdcbcb2489f7fade3539ce0862b788b21f7f87d8f5c30ed716ce161e8b3232059beedb2d5a44b8385ea92eebe978166dfa58d502aeaa76c6594c95d8b5c82eed7a2e59702d1481a6f384edae1bca5bf4dc98f6a5e8bd94d5eeb4b6c7d10097b2f5e2da59aa45f02bf8bbae9daab68f8bdfecbc31dafc3e96b10eb0317993e6988762b7f33ed52b1bd1a759e1c549e82eeff32df25c262277986ccac6c8e3f73649f04e8e3916c017174b14b0f80d6e5dfd3de36826885d57b3a6dc7a2076cbe56b52bbe98f36b7e57ae1cc759a7e612e5aac582cca4db03abda70cce691d349d0b45ec27dbaaaa9d6915bb3673d9f55c2ab32fa6f3a48c7793695f749f8dd19c9dc6f6925059ce5b70b517d7e98bd2a2325d3b556d9fb2c56e99cfb18559b46f6dda1cf34aecf616569649889f6f5097f44bf8aebf94660d75a12b5e532be8d97a72b3664493056f2ad78c246110bbdaef845a6e80d8ad057b6ea3a63fda652c282176d34de55aa0644d08d3b9d0848562558bb92a1856351695b755997da982a5ca18e3f79261048ceeb331ad62d76a4fa8aa912ccae9daa9eaf900b15b6cdc26ce31cfc46e2724416b29a85f85833eefc5bd76290add5322f1281cec6c179bd0aec43409de1ec4aedd64a8f96e88dd9a0d90d2bce98f36c46e75b684d81db2d65d908e5ba84c5156f6427472a655351695195e665f4cdf4d36f3a4ee0f41d328767d172126ef963ae766196d97f91cabbc476ccb34758ef92576db9d83f45064f1c749b1aa2874df52abb55a9637376dd24c8be085d8b57d25d47b3fc46ebdfcd35a37fde1e4ba5cef8be33ad70cf723162d704df7027b60b1c2bd8daefa683a178ad84ff6afaa7620766fce0cd7cfacc559bb871b839d4ff2e66e1df3046257ef6d52f4ec2719bbff5a72e8f2a1243ae49e8be13144da61d245e3f0e11d56e687109bdf47d7ef14bd1948d4e439e68dd8cd3f72e8fcf6f81e5b45a19bea0dd635ae49f96910bc10bb2696f7e71e885d7f6c31ea89cd175dd7194f63b1dbeefe9de8e6798a45e48a162ba67b818bda2dfbef45e372d97e55e2a2aa76a655ec5acd654fb214abcceb3ae609c4aede1ba5c88e36226aac27fb24c45640b4cfffed92e4c90fc73bf1ff9ebc4c7fcf8ac631ed62d7a7778ade0c246af21cf347ecf2113924ff9c02ff4d38e8f3b1395757a19894b411beebf7740de9b27c611f89bcc9d29c366e885d97b3a1faba2076ab675ed4a2e9e280eb757d96a5cdb99d458b159b1ff3aac2888b6c55f6dfab121755b503b19b3263a47cbef1aeffccc55c5a5bec3c20297e34aa4bd2d6c6bb9d8779f7d6314f2076f5ac99f7deb5799f27bdd80f8478f6fdf14fbbaabd32fd3d2bfafd80d8cdb180c3778aaa9d47e59a3ec7fc11bb0b19fb75278e1cea2d76d749ca6f720cf56538e86fea1ab28cf20a82f786902fa31f267542ec9a50f3e71e885d7f6c31ea898d08b439f7348d844d5f8a162bf1997b52f64d2c2005ddcff22498d4e7eb3d55898baada9956b16b339789a8307c58757e5a79548478b671fcd37388dd7402553f2365b467b98f72ff4ccc77fefbf87f4e54e7239783d8cda695ff61c2fcf7d1e53b45c7d6b1bd17bb8f85a417baf78d3ea6d43dc7fc11bb19099148cadf85ef76f958a1f8ea2d748e48d0c7a9c015cee2353494f16d858237e74825e3461ddc08b1eb00628d5540ecd6083fa3692bef0c270d12f4e487e39d972e46661ac2cc6d1789ddff5afccfdb1fc9f37f19f55361616e54af673795b1e04d1b6255ed4cabd8b59acbf15e7bd1d1f196a5d930e9036f39d0de1f19d7a7104e5dc73cc97a24abeecb34b4679a7f816d603a472176cdc4aeed3bc5e53a40e767b1e973ac7ab1cbe1bb446967dcde4d3d5f97e8cd9841f81cd8bcb374c7cbead8b1ecb29f653620e91712745476070cea57b18741b5b8a522026973ce3a9220eb23c8e447a98ac6d8a8661c84019d9c89f94f74bfc04f42b2f1eaaa885d2e6321a69d79c37c9e1c552db0ab6a675ac56e329739e90f27e331b9ac939ead2d74be23219e9a34cef79c89f95f17bd33ea982710bb7a16cdfbc8682a3c6d3c85a66d167d2cbdf17b55f15154e3ed97f55cacb5bb36ef1427eb806befecc5eebda2882a537bfb32c7ea10bb7a4f384a830008b82200b1eb8aa4613d1622306e5177a130d94dcbb04ce53ed8845dd6f5e5dad0a446b795b588f261a168b128229d3ddb9531b4149b64b1cfce3a1a8468f787c14ea7689256c5b2a81fc9c705a9526eb28ce9bbb1eab197d15e197516d9c0f439d7b593e9d85c6cfd316dbb688cb61fb08aea2fb2dd84d0e5f0e4ef8a3ea497c522afaf2ee718c4aeceac40591068360188dd9aed67fb2397a8cdadb360fe4991b72643e872921bb370c8a442951fdaaf16bbf78424fe7a6d729d04e2f2fef7c7ff1b1f71e1eae23e91a4ef5ae2f289ebba75fb58d5c2a1aa76ae2d9edaddbe205ad165c2e57d14bb0e2232880cc2f3930f5356cfabea87a33ae649d6fca8ba2fd3d05ed56360dbb9142279ef8ab57697b7c418fd66d91ed553165717ef14fe1d3e17f30f75d70123d6dc874bd97a317a5717bd2bca6201b16bf24b897b400004f20840ecd63c3f5cfcc82543380c8478a2b21f30de23149d3db509851cc7a62276b9bca5177b3f10970f5d8852662ea3d65329e871320eebd052db6954d5c2a1aa76a659ecda2cecafcd13494a1fa9e2e7952e1e9394df59ce33e570c73ae609c4ae9e75f3debba6f633f57e26fb4ef963e61dbd51e84727998aeab85f0a99c80b847669510656e3fad0e94329e8b94e2e0ffee81b44f478ecf770585b01aba6cf317876759f54940781e61280d8f5c0768e7ee44623b93a17715cf8c6a29a827b22122b52d003d32fe369b854c5ae65f6466efa440a7aa6f3433ede5ff68cc9483eb8f1a31effb0bb3b16c6644a992e1c54d98ffa54553bd32e765d84ff278c4e84a42d19c8dd80a2fdd1c71c160fff4617f7a2285a2121f879d5161137e6a18637b98e7902b1abf7e62810bbc67b408b3c7a69bdb4daa6a2185a3f6ad7faf752d256108897e3bf8f71940fd13d11d14adeb15c653e170edf298cea90a4dc0a826097e8e270fc23711c6545f20e4574afe8dd92b7bfdf669fb10f730c6257ef7d83d220d0640210bb1e58cff18f5ce52352155cd65964c7be5e93102f03bad8caf3f40e3d62672b89c0e730da7cc1a090a5b62cb8652ea2c6fb5c553bd32e76797cd68beeb226537abdca5e5dbebd8e7902b1ab372172c5ee42f7471a7ed434b90ecfc4fc7dd570581ba11b7f67d414bbb6ed1501c9db3a51f673e1db3b254f94da646366315ef71cab5eec0af9354574503401f1f79a090811a666be96f27735f70ccdab1010e2e7946210bb2aec2a28e3db8f9cce9075162b0ebcbb935d3b9144fb93ff510cb3e5eaeeeb2a656fb00acbb21751a33e54d5ce4c885dbb7de82ad3c259195d4f4a1df3046257cfdcb962f7ffb7773ebf711c599e7f51451a73b3dcd71665dafe03ac867d371b20b57d33fb605f9bbe5847a7d16ad8b27a611a33922d8c069dda5bebd2d475743075f3aa0898bc8fd0e21fb01a4a94af4bf3b8a2aa6211595954556664c6efccc8aa2f01a1e1aec888179f179199df7c112f2efd8faf1c97bd2bb7c5e41f69c5d27adbcce459874d9e1fd98718f7bed5826e55ec46764f619ceea52f1e5d9501f3e08756c758f362b7706eaed97447e9a608e09cdda648876907e7ec86e1eaab56c7044ebeccb0aac7f465257261ffd8e6b07b2b70531735252e9a6a6711c46e132fdeaee3ca464c64fd6af17897629f9bb6651edaf3980b22db1643347adaa3dec988466f11f5de25ce45d4d849e44efc6cfafc08bd12aa4db11be13de5e4eef1a3dfc8ee435d1f6310bb3e9e2e735807c46eb79d0ab11bbfff3c7c296da593a62f2b1e973307e96fddd7ec200d36282e9a7e9117bc5c3e6ec4988db924c6dc968c861a52937a8d960b4e2e6a639c548168da967969cf65de851e94d3f59b3e3f5c3ec6e8f4abc7d84655a2c7a6c64654beabd9de13959d35ce958d31885d9dd9b080652076bbed7488dd6ef8af2b0f0fd797953c923db0586adc8823eb5e784218d0d44b5453ed4c337219d35d10bbf9c71b3196bd44ba3c8e2f91d06de37f3d7f545ae6af6aa38d7102b1abf2caecef2a91183a026a666d7569553f645786dcb71b83d88de99e52f7f1b7cb630c62d7d70c9eb37a2076bbed5088dd6ef8afd5871ce7b76d8e23b27959c9227ee3fd49f1095e83acb5be465553e2a2a9761649ec8abeb63a6fe583d05ae8ba44ce6cef0575f3a8e9313b4fed851485beee7d366326a4c88a41ec46764f797af7f8d17b55feeeea1883d8f53583e7ac1e88dd6e3b1462b73bfe6be3c55924b0e9137b3ae25c884fa33f9b979549039109de931e639fea9c556c0448a370532fd84db5b3686277d2df485efc9cf79db7314eaaa649d3b6cc537b0d3e4b4e88d39e4d0668dbe7876336e0eabb72cdb2dda6c746e6bfd1d9df6db86a3c76b48bf4d8f0bdaa930fba3ac62076b5ddbf58052176bbed6f88dd6ef9afc987dc2453abedd772db9795894744a28b21efff9d1189e3815af9134bb5fe5f6ff96bdde3367c1bd9d44b5453ed2caad815fdcef7de7fd5ca127dce6fbfecbd71db751cb7314e2076cdee2abaf7dd06c448b68a80115bb7c900addb8f229d60b91f6a56f6b4352f5acce771428c5fbdfb7cf0a06e7476718c41ec9add6f16a634c46eb75d0db1db4dff057e719e49fddf96d89d7826705fa50340bc68f519bbdd463477daa0a65ea29a6a6791c5aee8bbf880c347fdaf38a3cf9bb8f3f81ec76d8c13885db391622212037e3c3d5f45602bc84cfa512414646550846257f45bf49538fdd0d44761d30fc05d1b6310bb66f79b85290db1db6d5743ec76d77f015e9c4f88b1db2f69e9de7404a86db12b3c943d30e9d5e7c479d0c8987890b31e7bd0b6c83d17fa0d1df5d2868899f70455757796007377a639df22b7e9f1a873576e7accce737bf939e7e2defaae0efb9a32d933e4eef3ff7dbbf0b1529cbb6bf4e7227627cf8c657ef69fde4460a4627702553ca7879c7fe5adbf056f8d9f8dc3db55cb9655ceedca1883d8557972417f87d8edb6e32176bbedbf49b46834ea7d4e8c89330e6d5e569e1263f78a2277fa21daf49edd3aaf640fcd11ad7bdaaf94ed29e33dda3ba3e507aecb3c7d8fa6a65eb09b6a679acf228bdd0987c9471ccef9ba8797d4c7c4f95eaf37ba67fb42aa1abf6d8c932a9b9ab665dedb139c734122561d986610af7c86b4fdb1d493c87a4c8cdfae5ab6dbf4d8503c1f3f6023fe89c3fbc0ebea393da01e7b5cf56ea0ba5fc87e8f7d8c41ecda787501ae81d8edb6932176bbedbfa2f5d9f22d62eb6cc4df1d317a978d5f5ade9a2a77c2891ef7383de53df69413dfb3398224166ad98b94e8e3887fc019bd25e9efc4d4a79ce8a9f80fc6d81e277e42448fbbdcf7587c003bfc1010c2f75fe8d507623c4fcd5ff1f1aaf8012b9bc38cd3897811251a3dedd1e8712881eba777a8a54b04b27c09d4cf9e239cb10fd8f819722e8045d475ea5eda8967c8e4d938f5ac28e682c8e655d62fce1f53af77d2237a1ccb2a1f9bf1932d71ceef27323fe675b6d2ef58c718c4aecd485b806b2076bbed6488dd6efb0fd6830008800008800008800008b81380d8756718ac86e4d2956de27c4db38123ea9f25e9d1feaf9ae56b8b41ecfaa0d85e1d10bbedb147cb200002200002200002200002711080d88dc30f252b72a1fbada17987e9f1e0b2e135d2e210bb3e28b65707c46e7becd1320880000880000880000880401c042076e3f04359ecae6c8808ed9bc6e68de877e92f8327c6d7152e80d87525d8eef510bbedf247eb200002200002200002200002ed1380d86ddf07520b2ac48ada5ace7f9fbed8db5717ac2f01b1eb4ab0ddeb2176dbe58fd6410004400004400004400004da2700b1dbbe0f4a1624ab6b1768b82cb28a9aff31fe65fa7c2f35bf70f60a885d5782ed5e0fb1db2e7fb40e0220000220000220000220d03e0188ddf67d5016bb17d7d788b19fad4c63ecbbf4f9a36dab6ba72e82d87525d8eef510bbedf247eb200002200002200002200002ed1380d86ddf07fa6297d3ddf4c5201117245582186237428f366f12c46ef3ccd1220880000880000880000880405c042076e3f247664db272659388ff58326d4ac8568a5da2fbe9f160cbb55b88ecba126cf77a88dd76f9a375100001100001100001100081f60940ecb6ef83920595c70ee989dd83f478a07b366f65ef2176231c18062641ec1ac04251100001100001100001100081b92400b11ba15babcfd8657f4c8f1fed4e4c0e256844fd10bb110e0c0393428d8daa71419eb2801b74114541000440000440000440000440a09600c46e840324b9b89112a32f4aa615048554d0707a96be18acba760b62d79560bbd743ecb6cb1fad830008800008800008800008b44f0062b77d1f942cd08d9e559dc59b1e0f986bb720765d09b67b3dc46ebbfcd13a088000088000088000088040fb042076dbf781bed8ed9fbd951eedff3ab920a4200d597784c8e7ce2488ddb973293a04022000022000022000022060480062d7105813c593958d2744f47eb1ad62c4b63202dcefbf931efd74e4622bc4ae0bbdf6af85d86ddf07b0000440000440000440000440a05d0210bbedf297b6aebb3c5977b9b34d1721766da8c5730dc46e3cbe8025200002200002200002200002ed1080d86d877b6dabba89a72ab3367bc88c0bb11be1c030300962d700168a820008800008800008800008cc250188ddc8dc9aacae5da0e1f289c4acd2f9b9d54714d167e9f160c7a56b10bb2ef4dabf1662b77d1fc002100001100001100001100081760940ecb6cbbfd47a72717d8d18fbd949ec32f65dfafcd1b64bd720765de8b57f2dc46efb3e8005200002200002200002200002ed1280d86d97bf89d8bd9f1e0fb6a62fa814c610bb9179b5797320769b678e16410004400004400004400004e22200b11b973fc844c0d644814bc2d8b49b88ec9a128bab3cc46e5cfe8035200002200002200002200002cd1380d86d9e796d8b95fb7025d15a9325cfa6dd84d8352516577988ddb8fc016b4000044000044000044000049a2700b1db3c733bb14be5a45326c9ac4cbb19a3d8cdc5fd2a31b65aea0fe747c4f951fa626fdfb4af36e563b245663fc4ae8d57710d0880000880000880000880c03c1180d88dcc9ba6c709e91e5364dacd18c46ef2db8dcbc4688b18ad11d1fb067d3820c677a9b7b49b1efd7464705d65d164f50fab347ab5499c6d12d14706751e1263bb34e4bbe92f832706d7391585d875c2878b410004400004400004400004e68000c46e644eac12995471766e85a8a1f478c05cbad696d8cda2d5a337121a712172df76e9437eed2111a5d43fdb4d8ff67f35a96f6ccbd2167126128399886d79339c9e518fa7d47bb5636a8b89dda22cc4ae29319407011000011000011000011098370210bb9179b452ecf6fbefc8a294c9ca868816968458d7c46e16391d0ec571497f0ae49253622ca5decb542534c751dcd116719e10d19b81ecb94ffdfeb6afc873d14688dd405e43b52000022000022000022000029d21305762371329af86c9784f27df4d8f073b213df1ba3dba4044fb3eda338da8568be3b3b754a2ae8e8da91db69c1b10b945d32a45ef795439acc82dda1344f442ecda8e485c070220000220000220000220302f04e642ec6622e5d5f23631fa62c6319ceea62f06223ae7f52f647ba6cb924d973deb826842ece6fb9343464febba7b2a56fb4e3e502497d613e24c4496434572eb6d612c4d9f3f12ed7bf983d8f5821195800008800008800008800008749840e7c56eb2b221f653a69522a5ef16e12cfa56d59e87e5c3bc349e383d4b5f0cca1988855abbb8919644bea8a0628fafee580d2976b34cc6c4762cf6e41e10a727d4e34734a2d7c99e7abd351af10b1689ac048e839c8949d22971c92171daa71efb9546a3d719a07b7499466c95185d364c6435ae73445b3e125941ecea8e74940301100001100001100001109857029d15bb59a6de5e2672eb458aa3e89b385eb7bd206297e8203d1e888cc4a5bfcaeccdc4fe981e3fdab51db8a1c46eb5bd5596b2876249ba6e82a9fc38269131597c043115b02a5c4218ef98db223238f38f55959fff2e395359fbdabc20c4ae2931940701100001100001100001109837029d13bb954b88ab3ce328764ddb7311bbf9d9ad3f4bba622e761d055308b15b19852e7738df57dbdb7149e0e4713fb0f3be5ae3a4578e4bf02176e7ed568dfe8000088000088000088000089812e894d8552d219676de41ecdab41746ecb287e9f12311ad2cfd252b5744d4f0c7d20f318add958df212ed59c3b533269b0c7407d1eb2c728b769a24c1721a4b72d6951f4d747986da23aedb3eca81000880000880000880000880802e814e885ddd25c4bec4ae4b7b4e0245ec6565ac1cd9ad11ae95d160f7c8a0d8875a5a06ecd4bf7ab1eb5d5896856676bc91c8d0ad5ade7c40fdfe964b54593501c7027c94d62d6f0ec01a6257e518fc0e0220000220000220000220303704a216bba64b885dc5ae8ff69c04caa52bdbc4f9b726515a9ba5cf3aa337c83266b9d83d25ce37d3177baf933ce918e850268fd8ff435e85db5e6753b372ff89bdd5a52cd04e6309915d5357a03c0880000880000880000880c09c118856ec1a2e213e254ebf4ab3fb6a2e63366a8fd3b36c1c307abb381e9c044aa5d8e55fa6cff74432aed25f9e90e944f2935314af41b1eb640878d25f0000200049444154a7ed7c343de2c9b61d9debbac41acb98753c8a322000022000022000022000023110884eec1a2f21e6749796ceb669b82ca263e5e5a90ab16bdc1e63df51ef655ad55e10b1abea833c8a77981e0fc4f137567f5d1260361d84d8b5a14604b16bc70d57810008800008800008800008344f201ab16bb184f88046944cce24357d09b76a6f6a1f67203128dd27ab3a333784700bd43f59822a447657369ada1fedccda749e357f4b438b2000022000022000022000022030261085d8355a424c744a44497a3c108986ceff4c5ec28dda134b96194b8a67d606128372b13ba2df4d44bd6ce02617378ebc2fa9ee9000b399cc213e10d8d821ae093496827c58309967b63c701d08800008800008800008800008f820d0aad8355e429c2f594e8ff67f2d765ee725dcb8bd7cc9b2497b4ecb982d056665dffb676fc96cd719385d12603afd918c17e931482efeb3b10362d7961aae03011000011000011000011000817a02ad885d5a7af5845e2d6f13a32f341d34b36459764d9dd8b56a4f71f44c20312844bc71565e1da1afc9f9bc58a0fe0589369af62d179810bb16e0428c350b337009088000088000088000088000082809b42076e92e31da92893a89b5d225cb6662d7a0bd8a25cb26edb944062b96d69ea6c7830b759e4c5636c492ee3f95ca6866a26eb97fcefb4895a35c5200cb986da82141951d355c050220000220000220000220d00681e6c5ae6e2f6b962c9b8833dde6a866c9b2497b01c4ae520c2655471691fd99b188ec6a8f1ce7825d628dc8aeb3bb510108800008800008800008804043046214bbca25cb26e25383e30129962c9bb4672b76f3fdc4ff94b4652f7619fb2e7dfe685b8341a94897049865ffb08cd9021cc4ae05345c020220000220000220000220d00a8198c4aef6926513f15949d560c9b297f6acddcb1ea6c78f36eb2ecfb34bffc3ba09830b6dc5bc68a262e9b052cc1b98a75d14cb98b551cd1484d8b5e386ab4000044000044000044000049a271087d8355cb2ec2c3e0d972c3bb7e7e2578de86c72717d8d18fbd9a519dd6b21767549e997eb52141d6257dfaf28090220000220000220000220d02e81b6c5aed5926507f169b564d9a13d77ef42ecba3394d480c8ae1d56885d3b6eb80a0440000440000440000440a079026d895da725cb72f1796597887f2c45e8b864b955b14bf4597a3c10d9962bff92d53facd270f8df4d0c1f4476fd534664d73f53d4080220100781bfdefc8f1f38e35f4dace931faf05faf5f7b1c8775b00204400004e22780fba89b8fda10bbf7a97f96a447fbe24c596f7fc9ca954d22fe63a9420f4b962bc4ae383e29f43ed953eaf72fa7473f1da9405546dc54171afe0eb16b084ca338c4ae062414010110e81c81bf7effefeb9cb3c1c470cef8d7b7aeffe576e73a028341000440a02502b88fba836f5eec3a9cfdaaea6e96a889d336317a9b883da47e2fd1118aaa7aab7ecf8ffc4934cf0c366de69046b495fe3278a27361b2ba7681866fec5446b7752ad12803b1ab01c9b008c4ae213014070110e804811bb7eefc17117d901bfbe0e637d73eed84e1301204400004222180fba8bb23e64aecbae3400d13025d1260365ec39e5d1b6a5946ed7d22faa87475c08f587696e22a10008136097cf3fdbf7fc538fb21b7e1f1909d6dfc70fdfa499b36a16d10000110e81201dc47fd780b62d70fc7b9ab0562b73997768935c46e73e3022d814057097cfdfdf76ff5f9f2ff21a2b788e8a4c76803fb74bbea4dd80d0220d00601dc47fd5187d8f5c772ae6aea9200b3018fc8ae0d354476eda8e12a10582c02376eddf94f22fa24eb35a3ab37af5fbbb75804d05b10000110702380fba81bbfe9ab2176fdb19cab9a20769b7367975823b2dbdcb8404b2000022000022000022000026e042076ddf8cdedd55d1260364e4064d7861a22bb76d4d45765cb9568f913e2b49e27f47977eaaa3dcef8de88961efc70fdcba7eada9a2ff1f5f77f7bb747af3e619c896444c2f6495222618c3866e644f4a14f6c0fcb599bf70f5a040153024dcd698d769e72c61fc77cff33658bf2cd10c0d86a8673175a81d8ed82975ab01162b739e85d628dc8aeff719127a010e7908afd8df57f9cee0d7b675f5725fab971eb0e5755a1f87defe637d73674ebc88f4410b60b91aefb275e5eef8de8d53dc77e8864478f89d353ead163dda5b23e1979a86b86d9cd6fae3115c442c2127239ce47d37e63cec57a75fa55d56f9ffd55b1d5e421aa996132a4fe9eed87288336abcc379ab32a06a1e674b15dcb76f618e3b7ffedfa5ff654fd98febdc498d3bd9b37ae5d35a9a358b66e8c7bf069ed7d41b37ee379abc3c3e77cf4799f98b6bdd5b1258768e50b5f7c7cfa4c678cc45806623746af4460539704980d2e44766da821b26b47adfaaa1b37effc9d187d6e586f65c21fcd97a0bae6b45e9cf3c4197f3fdf9769d881bcf853c6f855d98bab653f44f4f8b6ea1c57cbbaa77b78cec8435dc662f7c6ad3b22f1d374e4ffe9cd6faebd67e3024bfb959c7dbda4893ef9ecaf8a91258f49b50f18e3f79c8598cac8f2ef5a7356556de8393d69df533b0f86ececaa6e766fa95f19fbf4e6f53f3f5071a9fabd0362b768ba72deeab0f0391f7dde2784edd18c2d35482d5ff8e2e3d367eaaec5590262374ebfb46e15c46e732ee8126b4476fd8d8b0aa1fb9471f660d41b6547b4f446bdb738e322d1cfb4b8113f4905afe3cbbaa857f9e2fc3fbfbff3c188d3a022129d7dc1164b9627a4f2a5cd93e5cd65809204468efda87d1176ac7b869187ba8cc4ee8defffe313e25c247f9af9638c6f988aac5c48baac04a8e4eced25cd737f55b3d7933ff786ac7f5537d2eba14de59c55f5bb89392d6cd068476cd910db1eb2bffcde21568dc856bd6867f9ae607c3264fd0f75fd5464d841b13be982d18782e97e87beffb8ac00896c6ca9a69c962f7cdc477dfb4cb763b19583d88dcd2391d8d3250166830c915d1b6a88ecda512b5f952fb31282f1fcaf6e396afec01291d4c94bdfd3213bfbb018d9283e1c459d263633622775cb816b5e28f688b17b759192ecda117d5e8a646b885d21e68afde0c4de6523f62e675c44c68b2fc30f6e7e73ed5359df7d3212cbc3eaf84e9d339b1553f943232afd3acbf1cce0b15b965964e18bb38f9734d1bd996ca41efaab9a0bba6323ff08253ee0542ddf3f618c7faaf30142b7cd2adb557356d5e7a6e6b44b3bf9fd4fccf3226f2dc15bf341e1f1cd6fae7da862a4731f99166aa1ef0ba1e6ad8a83eff9e8eb3e11d3d8f2750fcdef7f331f236d3e06f8f6996a8cc4fa3bc46eac9e69d92e88dde61cd025d688ecfa1917c5a8aecebecb7c899610c81ff4187d284bf4e4ebe541d6cbbcfdff2a4699756c9fae4f240de9f3a110eee2c555ba04d7a41f995da3e51f8a22ba2ada6952b7abb77db69573134b98a57f4376f61bdd659d930a4cec33e16c526f557f42f457e54f1bbb6f7c7fe773e2d9314b65e1abb154d6a64d553f747f6f6a4efb6aa7b8f730efa7f4c3df3483bae839e3ecf6bfddf8b3d147415721e2ea7393eb4de66dddb809311f4dfa517d9fc8cef4767e2ef91a5b7582d4d417ae7c42f84cf7de125b3988ddd83c12893d5d126036c810d9b5a186c8ae1db5f255376edd110fe7f38cc543d67f4f6739dd246b7355f4d5f5e158d7bfbfdefc8f1f38e3b3914c87335433c15f9158caa61f376edd111f025e0b8e8a24343675dbfadd675ba597314ef7a605bee94707db17761dce3efa1da2bf2a3fbad85d91684e1979746953d51fd5ef4dcd69593b551fec5436e7513c71ff3cff5309d63ab19b55a2f151a268978bdf5cae0d396febd887988fae1c84bdb18d2d9de8abce3dd4d6cfd33e0ce133d5fc8cf57788dd583dd3b25d10bbcd39a04bac11d9f5332e7c3ce4659684aa57f685d8465c156d16e25d168db4e987e42558ba44d1a66e5baffb6cab9064e4f1909d6df4f9f2ff9db2cd3851958d7d3a9c6dea958889e9445c5efaabf2a3abdd15cb296b97cabab6a9ea53d5ef4dcd696974c9e123592602c6d174b13ae4fcafee836149ec163e14891c08a6fb775dfce672adad08d299b775632996fbcfb48d318e2d1db1abeb0b0fe3a4f17ba8edfd28f47510bb0e84938b1b2931fa22afe29046b495fe3278e250653497764980d9404364d7861a22bb76d4ca57151f62364b509b14bb92645ace4971142f56567b95745e0e74ca84f2b3ce8b90d4af85444d930f0da5fd5886112a5b16aaeb54bfabf81693aaf8eaafb2ddc2d15d36fe92edc7a71a71e7ca4ad5a7aadf9b9ad3a1dad18d8ec9c4a1b8df4a96be1addd35cfce672adadd875ba2eb2fbcf644cc738b674ef193a6340a74ce5fc0ee433dbfb4ddbd741ec5a7a20b9b49e10677f2b5c7e981e0f2e5b5619d56510bbcdb9a34bac11d9f5332e4a470138463ace1ffe1e5ed68b3dccf7db4d4710c936fbaf2e3ddb87bcce753a6574ed5495f3d55651d44e3e8e48326d5626e6f2f97144d52fd5ef1adc661271f9eaaf46bb561f598af54a96565646dd5d59a9fa24fbbda9392d6bc776f97289f1f7ffbece399b49f257f5d150c658b61cda64b58a8bdf5cae7512ad96cf87d8ee3f8241cc634b674eea8c019d329562f7d69d56eea13a7d6fa30cc4ae847ab2ba7681e85f2ea4473f1d5539c556a024ab7f58adabb78d41206bd3b67f75f65744530fd2e3c19a4ebf938beb6bc4d86af6aff8c7f911717e94bed8dbd7aa6b65437ae4467a3c605ad7fbb545d8fc51b15d5d5b2afc27eb9f366bd3714f9cff5e97bd0edf792f23f9227d326467ef9926182a72727938563e34cbc7bf586730d5f5ab4d3f244bda9c935fe9da5bf3c2e12c9e4afd2aec452e7e38d1ddff6dfbd2acc3d9c67f138621fbabf2a78bddd375e72fe26209e17996f03692cab53da7251f63bcde3b8ab90faaf6de56f955969448f7439ecb5871b936e4bc958d9790f3d18543ec63abee5ea3730fb5f5b3b82ea4cf54f7d0587f87d89df24c2672876fec10f18ff3ffbb7269b2a9189c59f2cce91971da8c79c9b369ff7406b8a9d84d7ebb7199186d11232186dfd769232f73408cef526f69b7eac382e932e6cc963e5f23ce3665c2b4c6b643e2b44f9c76aafc1d036b5db688ecea92aa2f275dea4874428cbeae3bfa47d5bacbcb4355ddc5289549f44365af4f91284bc671f3c6b5ab4d7c10f0d98f625dc57e155fc68bbf9bf8c766bce870b6a977d2ef90fd558d4717bb4be34c246063248ecbc9feaafce2b34d55ff26bf3735a743b7531a2b159995eb184b8e66d1faf0e8e237976b6d4590cebc958d9f90f3d1854317c656d57cd4f5852d9f903ed3bdc7c4560e62775aec5ebab24d9c7f5b7092341a662250a44b9e393d4b5f0cca11ca48468849ff744dd611bbd90787d11b098db810b96febd65d2b368952ea9feda647fbbf4ecae988ddb12d4b5bc4d996a1d8969b233e72f4d80ef55ea6055b10d9f5e0e8ae555179fe1dd1536274db46f4da3e1cebd815f7c6e9463e5cfc61da0f59c29aaa7d92a67537d90f595b376edd114bc8cfcf57bef9cdb5f7a6cbe946092aea368a3ceb7276611cb2bf2a5fbad85d12bbe51511d23da13edb54f56ff27b53733a743b928f86c68c2b8e4552eedf75f19bcbb536625777dec67eff99b6af0b634bca53925ccdf7b3aacd7ba8ee3da8e97210bbd3627765432a3a88e8b3f478b0732e94c64b5853a900e2fcf7b4b4743489288ea3c5cb6239f49b25e78ee877b146779b16bb6279370d87db44f4a74093e034f3592e34ebc46e66cb68b4459c2752bff931f03ef5fbdb629c34cddac57c44765de8cd5e3b7d6e6e45ad279cf1db235a7aa0732c91ec25c8d45a59728df23259f3f35c4dedd079191c1fc3f4c63a8df87af18c5d22aa7c592dd66d6a9b6e02129b97d2b2609acd3a5b131d9c3d764933515528ce3af5eabc08faeeafcad7b676cbea95ec09d55a56afb2b1f8bbc9789c12bbd3595ac95782bcd2f8bd7527683b927d9b5a8c8bcc6cf6efba8c15976b75ef2bb6f7c71941591066bee7a30b87d0cf255f634bf0b4f5850d9fe2870ddf3e33bd3fc5521e62574fec9e12e3db464b5845148f6897185da81470fdfe3bb1eedf6d50801d1291c8601d4ae416e7da58f49623f8e3728c7d1758e416edb94f4422a959699936f6ecc6729b0c6747fe401547687c52db0aa77bc35effb64af4861072360f5c57628efda83d46c4b16e321117aeec8ad18baafdb892c88d56a22a4716959c6dfb1dbabfaa71696b7755bd3af539fac0683c4e895da388be8a9b4bff6deb36e98b8e1f64fb77eb9269e9d4198a8be398d13e6629f47c6c93a1ceb8d3b12fa42f74da977c609af9f0e9fb99a1c32dc63210bb3362f7ca2611ffb11947b187e9f123b1ff33cabf06c56e94fd8fc12888dd18bcd08c0df972bcaf8868bdae45d57e4cc707aff4c5d9e681eb4acda11f7b4376f6695da22f87bab36e35257625cb936b056c61e91ae924aa726051cbd966cc34d15fd5b8b4b1bbae4e9dfa1c7c603c1e4d04a28a95ceef3afdd7a9c737e3aa392cd95af274c8ce3ef47516b82ffe0e6346797f9cd8d8c47c74191f2ed7ea8e399d3642fa42a7fde9be34e1335d76b19583d82d78a47299a66fcf451cd5155d8d54ec1e10a727d4e34734caa2c1e3bf1e5da691c8d26c9cc8cac5abe3c453d5b688686d29c3b2498310bb26b4e6a36c267a47ec13c9b2dcd71d2c64e39dee79f1e128c4b109995bd7ff72bb58def4816bd25e5559c31788a7c4698ff5f8837fbbfe973d55fb2118e9f6c34428978eaf512c4db649d8128ab3cd9869a2bfa663c3c45fb2ba753834391e7d892d15c726dbb1615ce55759166d22927e64d26937c47d41d4196ade4edbdbc47c6c93a1ce18d6b12fa42f74da6fda673adc622c03b15bf04a7ebccdcf819d753f3d1e88a447d1fec52376d94322daa1fecbfde9a44e55e0f23dd222622ef83a894d491b07635b66935da96d11199ccf337c6bfb1c62571bd5dc15145f687bf4ea13c69988f69e1f5f32e928b3c83a6a0bc9e5681b87366796598aa45893ba386722c3edf4b26fadeca94dbe80fb68ab10a93db9f9cdb5dfd4f194ec3b545e537c99f2c5d9f4252d7f819f4ec4a5b4dda6bfaaf1686377559db67b765d05b6aa8f39ebc25edafe7baa2d123af516cb84be77e8266733f1ab2c53be6c458d499d122e4ecbc843cddb693bdbb8ff988cfd58c796af7b683e4f8dc649133eb3b90fc4700dc4ee941772a1249254991c7363ebc799a457b69584baae65b19b2793eaedb8ec69f694f4ea34db7b9d2793b2e56d93f40a62d796f6fc5c27220d3d5afa9c71f643b157b265aa2e2f6055d48afbb6aaceb2f449bdae1fb2e84b95f897d91482510d3ba3979573915c480ca3dbbff2b9a374b52eab7728cea68c8b7b8e43f55735464dedaeab4f720ea871a66095bdb6bf3735a743b7138ab1cefe5d97b1e272ad4a04b9de1fb3fa23b8ffa8c67617c696ab2f4cc649533e53f925d6df174aece6625664519e24437a9d1157644d7eb5fc44f3b89b03624c9c9dfa84f8e8fc389b6c392d6762f9aa882c96b32f9747c1b9e04dc6c71e8db3ff46700e6f4b62772663b2af4923f1bb5ed59ceed2d2d9b64e4459af42a2f3a39534323d43ecea529dff72b268834c10983c1c75a91597b3e90a11ddfa6d04a9cecba86f016ad31f5b7f945ee46c1a1f5f537b848aca3e5bceaa7a8bdd69aabf2a8ca676d78add0e9db31b6a4e87be77e8d66fe357c9989cd9bf6b53e7f9c7ac5b77ac3e82e95e6f3b6fa7ea9fcdeeae9a38d5bf3bdd7fea9ad5f5bdade9baf5abc6818b2f54754ff72d967ba82defd0d72d96d85dd910c70795b3fe8e33f00a815a17d1351262c94a96ec4a88d7faa5b4a26df999b2a7d43f5bf529b44c06530b62f73ef5cf9290fdcd23bd620ca896371f50bfbfe5125556b1d6893a43ecaa282ed6ef9287e6e39bdf5cfbb0f0c0737a89920acff2b980d2e33d7c7a43e7215f8a62129578d808e9a6fb516c4fb234d3c9a4ba4455a138ebd43be95493fd558134b1bbae2e5944a72ab3afaf36557d9bb94f3434a7259157aff78ee252d6aa5527368ca5fb77a7f225d8d4a92b5655bed469dbf6fed8e47cd4e947158b2e8d2d5b5fe8f269d267aab119ebef8b25762f6e1c69466e8bfeb21662c9ca86d83b2aa2c93a91ded97639ff7dfa624f2cab6efc2f90d82d9f639c1dd1c4b79aec67fe214288dea24f4e89d8567afc68b729e0d91e71623b927179901e0fd66ceda83847d8a94e610bced9b5f588fb75b2075a718f93eec3d1c41ac9798344ac7e79ac49fdb68254776f5db1fe108c2a5fc82c2238a5c4308e30eba2763a2c6c38ebd43be95693fd55a134b1bbae2e499f2a459eaf36557d9bfebda9392d6f877d7af3fa9f1f98d82b2b2b1b9755e705db3296b531b9f7d9d629fae272adeef536f356d4dde47c74e1d0a5b165eb0b5d3e4dfacc75deb675fd6289dd950d91c1d7743faef3deda3c8a27049459dbf32676c552f1e1b2e0308eac065826ac3b91f2a5cdaf6d213aa0fed966c8c872956d9265d6ceb640ecea8e846e95533dfc54bfdbf6f64661492611798dd0d80a52895dca6455a118d98a7649dfa713359110aba3dee844d7778cb30f8a09bcaa925be9b230e5ac5b6ffee2de587f550c4decaeaaab4e20f91a23aa7ee8fcded49c0ed54e295a6690a5de2411926445cd498fd1c688d37f4d7336a9d3759ce95e6f3a6f9b9e8fbafda81acf5d1a5b96bed05aa9553c762ee43343e7de126399c512bbe37db1df1a38c259e84edab2487e75981e0fc4fedf56fe4244765be9c882360ab11bb7e3b34cadc4de35897048be649704a7ebcb83d10b7ccdcba52e7dc1e15faf5f7b6c2b764d8e0a99b4118a910f21534c32429a4bb3a7db3689dae9b230e5ac5b6fd3fd558d4b5dbbabeac933308bfd8ed319d46b97d7bbb6a9ea53db735ab622c5758fb02c92e5ba5cbf8ea36c192a11898f4ae77f318a5de3795b5edeaeb53524f4fda7ca375d1a5ba6bec83f3c28c56e6cf750dbfb51e8eb164aec0a98c9a5f58438db562e2b66fccbf4f99e587eeced2f8ff08ae8b26a49b3f5b2695fc6c62476736e6bc4e932319a7c0098ecbb15d992c767ee4e9286f57b4f42edb73db785b155e27cb2cc58d834f1a9389e4844ad45b2b327d4efef87b2a5ced710bbbe6682ff7aa61e7a24220432b127154ee51791d2f98f215f9c255fa6497624872eb1bcbe776f7e73edfc58211b412a79d89338fea1eaccdd908c8a7d376dab9c61d46eb9b8c457ce99804d38ebf6bbe9feaac6a6aeddb27af20860f1a8b02c0a5837c75dda54f547f57b53735abaccd2722b84741c561cc566733f9131cb459588e4968e819b948f51ec6682a9fcdca8bc3f363d1f7d8cfd2e8d2d135f688bdd5b77669389d9ceabf2eaaddae462aa7b4b6cbf2f9cd8cd04ef7839ed7456e6825fd8c3f4f8914858e5fd2fdf2ffa6345c58722237393fb57ab3ad8b6d84d7ebb2184add8efbc69b9cffa9018dfa1ded2aeabd8cc04eeab61428c84b8355b8a3e16becfb2e38b38eda4bf0cc6c23cf01fc46e60c00ed517a204278cf14fab84d9a4995c208b97ad77cf9b963cd47cbc3c5475ade2cbb428fe60c8ceaefe70fdbad652db3cfaf5f7f3c888877ec832a7defce6da7bb2be8464546ccfa42d499442b924bbca57f2fd8ce5b3544deccb5fbe8a595aa5cbd975ea6da3bfaa69ab63f7741dd99ca0e54f889310b9afe7e6a490c68ba7699baa3e98fcded49c96debfc6cfc67bc3ded9d73af78eac8ed1f20fc4489cb33dfd37932539d49c9724449a692a56b1ab3b6fdb988f3ec67ed7c696cf67551b3e33b9bfc4547621c5ae7040ade8ecf7df711548754eae4cf243e144b6e9a06b43ece61f21c4470691c5da5c54567752445b77d2e381484aa5fd97271713825b95bd59bb4e223a1409cb4c6d3169603cbe376696bfe4d72341952948cfe5f307b3100c334be0c4b2be57bd97b7652f7d257138b6494b6488c8ab69176e5dffcbedaa6b2a96698ae2278cb37bacc71f5445b1b297c5115f97bcac3a6795ceed9ad9435715752ebe60f96634cdcee465ae1465735c265ecc54ebe3a82a5dce3afd6ea3bfaab9a03b367aa3de5b9c713187d72bead4fa88950b91997b75c8f128b3b5a9395dd70e67fcf688961efc70fdcba7451bc50b7d8f5e7dc2382b46cdb3fb8e2a722e636c224ca7eda94b046452a7cefca81baba6d7ebccdb36e6a3ee7c2bb2283ea3ba34b6747c31e9afcacf6df84c750f8df5f70516bb15c71011dd4f8f0742e004fbcb32f032f6b3ac0197e3667c1adca4d835397bd6a98f22c2ca685b25343391cb69db32a2ac6ba2d15156ba954eca41ec9a126bae7cfe355608de722488e80167fc7c0f2be3ec93a230ae7bc12b3e1c6d7aa57a69ab79b198342722bcd3fb70c5d2bf19713f65d7093176b5b87759f59097f54b771f5f138c745f5626e56411b6baa5d83a7e9525d619b2b3f7a63fa884e2acaab7adfeaab8f9181be26ce321eb5f95093759fb3eda54cd5955bf9b98d3c2068d7684d89d16bce21e29bb4f6a0b5d9f6237af4b7c542bddcf4c7ca09a1f2a7fd95c5f777f6c6b3eda8e7d19eb2e8d2ddb67d574bfdbf2996a6cc6fafb228b5d7966e611fdae89a5a649d531482d66609e1ea44d895da7a3996c6755267a59523c62288bf6739e0616b945abc59ee34425c04dbb0ab16b4aacd9f255115e0d2b6a2319b62f0fd3edeabcb4e5825d2c45ae8a6c6974851ef7185d75495035dd48c592ccd2bea3a61899bc644bf6723967bb969ebd5858566bf3d2acc359556f5bfd550d4ac7b1f180317e4fb525a16883639b59753a7356d5f7d073baf061e73f1def1d7b4376f6a9cef2679379a862247eafdabf6be203d5fc50d961737dddbc6d6b3eda8efd2ad6791fa31f5b3af750d5b86dcb67aab119ebef8b2c76cbcb3c393d4b5f0c569b705672714388aa2f4a6d05488c65d39fd062378f6e8b7dd33e972b9b76f580fafd71147f38144b9c7d2e5736b5e59046b4e5eb430bc4ae29fe76ca5724b5911b93ed6febdfae8b18d9be3c988add49f9fc812bdfaf588df42931ba7df3fab57b55456c5ee6b29703493296e299c04d32d2ed4731dbab4be2af69a6376edd112f7e6275c0e46f66c9b8ae7d2581a6e0acaab7adfeaa66b9c1d818af5ee0f4947af47848670f7485578965e12c66958db2df4d8496aafe5073bad86ebeaf5cdc3b4c3e98ed31c66fbb7e5070e525dbbf6b52a76a7e287d64717e77ddfd9178b60ffa3c5addd6fd47d5efc9ef2ad65d185b36cfaae97ec77a0fd5f561d3e51642ece6c252881a4516e4e6f6cc2a12554d8f83031a51e24b04e90eb09062b752e8d71ac71e121bedd3889e14137865cba05f2d5da65e6f2dcf906c225a456455fca93264cffa44647e1e8df669e9d593e2d9bc9990efd165e2bd3522feb12ef3ac1ca7bbe98b81d8b3ecf407b1eb84afd18bc557de1e2d7da372d3e400001933494441549e9f8f2a5efc26193fb3176acef85ed57eb6460dad694c2c211b125f679c09fb8b4b0fb3a5898cb3c7d41bed99bea8c6d247d801028b44a0a9393db527b7f2ded1857be0228d8daef41563ab2b9e0a6fe7dc8bddc4e46c5dc6be4b9f3f12c71205ffcbb20df7e89f5a0d3518719ed81342ece6c7f6ec1a4473ed124b8db36dfb4e74952596a2fed96e51dcd6f9702ae99649a2ab43eaf7375d92a441ec6acd2c14020110000110000110000110986302f32f765736f6b597a7362876c598aa1024f2e1d6f05ede206257df17f7a9dfdf76117be7a27d9c0c4c7cc03089f64efbe08038dff6711c54fe8143446dffa4714f71ca9c0cb1ab411845400004400004400004400004e69a00c4eeb47b6316bb0d25ce0a1ad9951f87332b2cfbfd2d1f22b7386bf33dc226a2d79bc82dd9328eea8bfdcab502dc253337c4ee5cdfb7d1391000011000011000011000010d02f32f76e7611933d1617a3cb8ace14f6f450245766567bf8a7daacf88f8968fe8a90a4072693d219e457aabf6e806c98e2cb34b95fd196257e54dfc0e02200002200002200002200002d504e65eec8aaee7fb76c51e4e45e6dfc812548dcf85dda7fe5962b24fd4c7800f2276651f1e38dda5a5b3ed26fb37de47fbc64e3979147b48fd975b8ddbf26a599ce93b9b99db71950122bb3e6601ea000110000110000110000110e832818510bbf2a8da862cca789a1e0f2e34e1d09a8cc49ff93e73d5a63f21c46ef6e161f50fab341c8e93808d286d3acbf4348bfc8cdff1d143443b6d729fdacf4b3ef62b43ecda8c7a5c030220000220000220000220304f041659ec3e91467a1b4a04955cdc3822466f970653c37b73ab067328b13b4f9327e6be40ecc6ec1dd8060220000220000220000220d00481c515bb1737d2d2d2d131f1fbe9f16012ed0be2833c59d2cf92ca1b8b2cab3a06b1ab2214f7ef10bb71fb07d68100088000088000088000088427b0b86277e5ca2611ff518ab8df7f274446e0495b5542b209a1ad3ba420767549c5590e62374ebfc02a100001100001100001100081e6082ca4d81def1b1da5e50445e7e09dce38ad735f9e0df86fd23259422a96a4c78f769b1b02f2962076dbf6805bfb10bb6efc7035088000088000088000088040f7092c9cd8cd33337fab749d63365c59fd7912a2fd9a636f26971dd08892969337093b4be7c0ba1c87a3648e02de0840ec7a43898a4000044000044000044000043a4a60a1c4aeb6d07ded4c6f9991c7c7dd2c1f6908dd71eb9c9ea52f06ab6d8d2b4476db22efa75d885d3f1c510b08800008800008800008804077092c96d8adca805ce73fc6bf4c9fefa52e2e3688e8ce36d350666859df20765d3cdefeb510bbedfb0016800008800008800008800008b44b0062578b3f7b48fd5e6293b4ca229afcda22885d2defa0509900c42e46050880000880000880000880c0a213582cb17b693d21ce8ac9a14e89f16de24c1c37f4be6240dca77e7f5b257af325cb9bc4695b7a96eeeb464e89282122d176717f6cb024593a831e915d1d4af19681d88dd737b00c0440000440000440000440a019020b257605d27126e6e10e7112fb617769e96c3b3ddaff3517a82229934af08a6a0e89d33ef5f8118de849e62ac656b37f9cafc9123b55b8f37c4f70b2b22104ef566617a3edf478b0d3cc1090b702b1db267df7b62176dd19a2061000011000011000011000816e135838b15be72e43c1ebe2f95322b615c31143559d80d875716ffbd742ecb6ef0358000220000220000220000220d02e0188dd02ff64e5ca2611ff31b05beea7c70311c98df60f62375ad7681906b1ab850985400004400004400004400004e69800c46e49ec6e48cf97f53e0646f4bb36cfd155f50762574528eedf2176e3f60fac030110000110000110000110084f0062778a71be6ff61fe1b1672db49a804ad547885d15a1b87f87d88ddb3fb00e0440000440000440000440203c0188dd59b12b8fea727a2692461131b1c45924a07a53c33587c4f80e8d44e22afa425abedf7f4795d959a39d2045207683606dac5288ddc650a321100001100001100001100081480940ecea885d627f9c4e26956774de95666e2e9c8d9b27bd3a920ae488973243ec463a6335cd82d8d5048562200002200002200002200002734b0062775aec5ebab24d9c7f3beb6df6303d7eb4591c012662509af48ad3b3f4c5401c7f14e59f49ffa2ecc0821b05b1bbe00300dd0701100001100001100001102088ddc220482e6ea4443416b78c2555c703998ac17134789412f18f89d8431af16d24a8c20c0c450062371459d40b0220000220000220000220d0150210bb969e3215bb96cdb476d9bcf7af35b00d350cb1db106834030220000220000220000220102d818062f7caee388a59f82bec698d968cc2b08acccd51675836610db16b422bbeb210bbf1f90416810008800008800008800008344b402e763dec274da4fb5f45e766933d35db5dbfade57d4cf2e45307d43fdb4c8ff67ff5db4a3bb541ecb6c3dd47abc96f372e538ffe29a9cbf9634cd5b8a039f988e5833fea000110000110000110000110888340556497d2e3017331b152ec72ba9bbe18088188bf880940ec46ec1c856935e745df4f8f075b2e3dab14bbfdb3b7e6e5438f0b1f5c0b0220000220000220000220100f0121769fc88ed07116bb17d7d788b19f255d3da5fed92a5e8ce31904324b2076e3f64f9d7555739a18ff327dbe2712b059ff2517378e88d1dbc50a5cef17d606e14210000110000110000110000110a82020c4ee3e117d54faddc319b0c9ca8658d2fb66a96e4477a31f9010bbd1bb486a604d5497c8cf9ce6b20f58e9f1e0423789c16a1000011000011000011000817925c0b2a376187d51eea0fbdeda6465638788fe5401efb3f478207ec75f8404207623748ac2a47cafaef87855fec04474981e0f2ebbf42ae45e6017bb702d08800008800008800008800008c808b0e4d27a429cfdadf4a387e8ebf86cd9e17fd7a087e08d745c42ec46ea980ab31442575ce53cd742ee05ee166d580b0220000220000220000220d005022ca9de5beb1c091200aa23c7391e4e7769e96c1b7b78e31a2e10bb71f9a3ce9aeacce7e757396761cee672d54a0d0f7b81bb431b968200088000088000088000087485409671b9e24c4ea27eff9df4e8a72397ce24ab6b1768b82c9656be5f53cf29319652afb7e3da9e8badb8f6350188ddb8474336af464b5b3462892c61d494f5a7d4ef5ff631afaa9253f9d80b1c376d58070220000220000220000220d0450213b12b4f52e561e96326a6c7e77e56ed252c723b242ecaf2ddf4c59eb8067f2d1080d86d01baa2c96c1ef5d92671bea9f878345593fbdefba9392c3bbbf714c9a9e21b2bb008044000044000044000044080682c76abf6ed7a486a33816c287827979d12b14cf852bfbfef233a05a7eb1180d8d5e314b254be2a4208db352212ff2b4b3c556782f33eddf3f95b9d6ccef9ecde900c51370880000880000880000880c0e212188bddba44521e8e2b397f611eb7b3ab1f952a39661cf5656c3f3d7e24eac15f200210bb81c02aaab58bde962a3d15d15f5f2b2372d12db63348c4b69fc8713bb4d12a0880000880000880000880c03c13c8c46e2678abcedb25f21eb9d148a8a3c99c3d2436daa7ded22ea2be9ac8348b41ec6a82722ce6217a5bb4e03ef5cf129f09df2ae72ba767e98bc1aa23025c0e0220000220000220000220000241084c8bdd2d22fa87b4150f89aa8af5e6d1e4ed9a7378cd3acce91911ed22ea6b86adaa34c4ae1f8eb25ab20ce8c4368965cb93eb12b7991871409c6ffb8ae69e7f041b279893477519fb2e7dfe48cc61fc81000880000880000880000880407404cec5aeb0ac32db2a9197a34ba42ffe93acb29c893d891ff92384a8af0b4b885d177ab3d7e61f76c60297b810b8a67b6fab8c3924c67742ae6ca85d8511e023983feaa809044000044000044000044060d109cc8add958deae82e85df9b375ed2f9c61af14c1088c8d7db5e1c84a8af3146885d63643317048ade9e66ab1788f6a97fb6eb73a9b2f443d4388bba2c03b328ee7d7b831b715c0d02200002200002200002200002b30466c4aef8a926ba7b4afdb3d5d02fd8d3e66511b1d1ab4de2bd3522feb13fe7e551df21db4f7f193cf157effcd404b16be6cb80d1db03b1349f867cb7e9b19aac6c88b9215b66ededec5e33ca280d02200002200002200002200002fa04ca6277e58a586af9634515c19633eb989c08db42447d9938d797ed52ffe57e93625ea7cf6d9581d855930f12bd15ab1022188fc9c58d94187d21a580bdbaeac18112200002200002200002200002ad1328895d6151b27265b732921ac98b6eb8a82f1d10e3bbb4e0515f88ddf2dc2c8c399f7b6fa31a7349dd760621c697ce2ee3a350ebf76e18000220000220000220000220a0202017bbe3f370c512c6aa443a9fa5c7839d98e822eaebd71b10bb639e8b36aeb2737e7b62a543c5dce7fcf7be333efb1db9a80d04400004400004400004400004c604a462f7fc25bf7a39b328129de09d38755122702107f1a28add455e31a014ba91acea0839ee51370880000880000880000880c0fc10a814bb63c1bb21a2b77faae96eb48277dae679de5b196a282e92d85db4e8ad6ccc28856ec0e3c7428d61d40b0220000220000220000220b0d8046ac56e2e78ab32b24ec87542f0ce447d87c310679eb6963537c4109e67b11b2e7adbcd2cdfd9c720c6c49146f26d0bd8a71b628aa14e100001100001100001100081c004d462373bfb7659ece1931d413231afb3676e0689fa12357a1e6a8831326f623758f4569c7bcbd87e7afc4888c5cefd2597d613e2ec6f35869fd288d69a3ef6a8732061300880000880000880000880407404946257589ce809de43eaf737d3a39f8ea2eba5a64101cf4a3dcc22672d9c95aad9f552b1ae8bdd6c596e9faf11679b44f4912d87f27579f4b6b7b4dbedb12e3e62bdb1a338bf1a42d7dfc0414d2000022000022000022000020d13d012bb0682f79418df4e9fefa50df72348738b1cf5ed9ad81d7f9079638d886f12a73562f4b697412196f0763c7a5be4908feb1d0523085d2f030895800008800008800008800008b445405bec1a085e51f4804694ccd3d2c7d7515f12e7ab8a6861d5b14ca6be8c32eadb05b18be8add9501b8fe151aa88e68a4a2174cdd0a23408800008800008800008804084048cc4ee6bc1ab5cfe38e9ea7deaf7b7bbbcdcb3ca6763a1c5368973217cebf6339bb87d6aaf6f7fbf4d6e318a5d446f4d86d2ebb219b7d11b09719e687ca4e9fc76043b4ab80a044000044000044000044060de08188bdd0980e4d2956de2fc5b4d20732b7a5f7f005816a2d77fd497d33e11df4d5fec8924618dfdc5227603456f4f8958c695faed7e5408e95043912b4cb94ffdb3243ddaff35a45da81b044000044000044000044000049a20602d763391a73ab2a4d403f690f8286d5ab8350172ba8d7051dfe6045a5b62374f8636fe70e073ef2dd121b5f4e1a095f1d72311c5d55d6e3f577bed9be68df6400004400004400004400004e224e0247633c13b4e0ca4caea3adb7b91f4a7c776a8d7db6973a96e132e99116ffae243c7b4a0e2ad49b13b0f1f07741c16b2ccebb383d996e1b2fa03eaf7b7e67d1e86648fba410004400004400004400004e224e02c7627ddd2ccf05aa63087d96eeb5c3d25ecc492675f47e2785f961b52ec76f503406c53d8315b38a2b9b13914f68000088000088000088000087825e04dec9e8bdef15e5e9d4438151d998f734c75bc142ce1d264c92ea71ddb8cd8bec5ae43e4b10ea57791afe3b7b6ca783b079ad35d5a3adbc6dedcb63c89764100044000044000044000049a20e05dec0aa32d12e3c8fbba90515fbe469c89bd967ea2be138686c2d787d80d2470832edf6e62d299b4e118bd2d3635d789e24cb8a22c0880000880000880000880c0fc1308227627d8c6a277698b462c21466fbbe344d4d78961b6579aa7d45bda55edd1b415bb534b944574dfc7914c53c7319dedce7b34d25bf4f6f5403925c6d245d81fef343770310880000880000880000880c0dc11082a76a769252b5744b4728b887fec8522a2be8e18eb33639b8add6c2fb25906e03afb0f89b15d1af25ddb65d88e701abddc73f47662fb0111eda4c7839d463b83c6400004400004400004400004402012028d89dd497f5f47fec4525d4fc237ab1c515fcb31754844695114e98addfcf8a96dc765d788de5a3aaf70d90131beab13b9f7d31c6a01011000011000011000011000817809342e768b28b2882fe72233f1a69fa5ce4484a8aff98813cc186d4f44af4aec7a10b988de9a7b69f68ab1cff689d82ef55feecffb126f575cb81e044000044000044000044060b108b42e76a771bf4e68d45b43d4d76e203a47ceb30f057c8b1893476b47f43bea516a17c9650f89f82ef5fbfbaa3dc376bd8fe7aa007b6f279d1b476f876c7f119678c7e35158020220000220000220000220d0350251895d447dfd0e1f67e1ebc79c6c9934f51720b9d4c5f5352226562888950a3e92738d5729207aeb6724a216100001100001100001100081852210b5d845d4d7df581c47cd475b3412515b1f99b16b6d3b254e3bb4d44fe739828be8adbff1899a40000440000440000440000440c03781ce885d447dfdb93e59d9d81a67c6f67496efc4b47cdfef3c477183644e46f4d6dfe0464d200002200002200002200002209013e8acd845d4d77d0c7b48323536a290dccaddb2786a40f4361e5fc012100001100001100001100001103021301762b7d86164783619024479b472c77879f39c8a5c446fcdc60f4a83000880000880000880000880408c04e652ec4e83468667fd61975c5a4f88675998df545ec5d877d47b99cec3713788de2abd8d0220000220000220000220000220d03902732f7611f5351b93b9f0dba9d9cf7b4823daeafab13788de9a8d0b940601100001100001100001100081ae115838b18ba8afde10cda3bc7f9b29cde96efa6290e8d5105729446fe3f207ac0101100001100001100001100081d004165aec22ea5b3fbcce8f2b12c546a3fdf4c5de7ee801e9b37e446f7dd2445d20000220000220000220000220d02d0210bb15fec25edf6e0d64612da2b7ddf3192c06011000011000011000011000815004207635c922c3b326a8868b217adb30703407022000022000022000022000021d2100b16be128447d2da079ba04d15b4f20510d08800008800008800008800008cc3901885d0f0e46d4d703c49a2a10bd0dcb17b583000880000880000880000880c03c1280d8f5ec55447ddd81227aebce103580000880000880000880000880c0a21380d80d3c0282467d89ef762d437215eee4b71b97a9cf3689f34d227adf8b5b383d2346fb446c97fa2ff7d3a3fd5fbdd48b4a400004400004400004400004400004a22700b1dba08b02457d4f89d38ef897fe3278d260779c9bca78bc1a8a737b3789d1dbce158e2b3820c67769c8f6bbc6c353ff510d0880000880000880000880000880001141ecb6380cbc477d4524b3c753ea2deda6473f1db5d8b5caa693d5b50b345c16d15b2172dd23b888dec6e866d80402200002200002200002200002ad1380d86ddd05630302447def13e73bb12c73cef7e16e67515ca2371db1237aeb08109783000880000880000880000880c0bc1380d88dd4c31ea3be874494a6c7839d36ba9a6552664c88dc8facdb47f4d61a1d2e0401100001100001100001100081452500b1db01cf7b89fa8e05e37653a2d783c845f4b6036313268200088000088000088000088040ac04207663f54c8d5d59d497b2acc5e64b8233d1cb92f4f8d16e88aebb895cf69088ef52ff6c1799934378077582000880000880000880000880c0e21080d8edb8af93958d2d2226c4efc7865d39a01125be32168ff7e48e520b3bb265d610b886de43711000011000011000011000011000815a0210bb733240c64b9d475b34e25b46c7f870ba4b4b67db2e91d4e4d2956de25c6457d64d3c754a44bbd4ef6fc79a357a4e8605ba01022000022000022000022000020b4b0062770e5d3f8ef61a1ced63b9b439f9edc665ea91487ca57784d0f9d148af765cc4f51cba0c5d020110000110000110000110000110f04c0062d733d098aa33de3f6b10e5cda3b9df6af5b7e1e4585a36a1100880000880000880000880000880c05c1380d89d6bf78e3b67287a0f69445b557b7993d5b50b345c16c9add4470941e42ec0e8421741000440000440000440000440204e0210bb71fa258855d9f2664edb1a7b7a4f89d856316373b66c99d1aed6f58ca5e9f347e27c5dfc8100088000088000088000088000088040e30420761b47de6e83596476f446429ceb2c41fe6c722e6f7edc91d89fab4842c51e52ffe516f6e4b6eb67b40e022000022000022000022000028b4e006277414780767229b18f97d11322fa870295341abca078d16d100001100001100001100001100081960940ecb6ec80b69b4f2e6ea4c4e80b373b10cd75e387ab4100044000044000044000044000047c1380d8f54db483f5e92f5196748ef12fd3e77b6907bb0d93410004400004400004400004400004e69800c4ee1c3bd7a46bdacb9a5f577a4a9c6fa62ff6f64dda415910000110000110000110000110000110688200c46e13943bd2467eac9010afef2b4c3ea511ad551d4fd491eec24c100001100001100001100001100081392600b13bc7ceb5e99a86e085d0b5018b6b4000044000044000044000044000041a2500b1db28ee6e349609de57cb4f24e7e942e876c385b01204400004400004400004400004169e00c4eec20f0139807c0faf58d23c75ae2efb637afc6817c84000044000044000044000044000044020760210bbb17ba845fbb208ef68692b33a1b7b49b1efd74d4a239681a04400004400004400004400004400004b409fc7f0daecae15fef85170000000049454e44ae426082);
INSERT INTO `sasic_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(5, 0, 0x89504e470d0a1a0a0000000d494844520000078000000438080200000067b15614000000017352474201d9c92c7f000000097048597300000b1300000b1301009a9c180000ac5649444154789cecdd895714c7feffffdf3ff241bd263131f1ea4d6262aef9e6c66b2e9b288a1ba2284ac45dd9f75d165905051141101104044176907d1704456471092afe23bfd2369dc92ccd303d3088cf731e27077bbaaaabaa7bc8392fcb77ff7f6f9f3f0000000000000000c0ecfe3f8b8f0000000000000000b02411400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000000000605e10400300000000000000e605013400000000009f8a574f7bd39c4efaacb04db273bf139ef0a8a95a7d9fcf87dac7bb1a07abcafbca4a64433577c5c13f1e77597cca0000cb22800600000000e053315473d7f3fffe27f15d6977fee7fd7927825b73f3c6daeb67a6fa8de9e1f950fba3a6eaaec2c28aa8a4eb1e81694e272ffcef70dca683911b9cc3d7ef9145fdb44f1c4cb4397269f76971897b17d2ba8b8b44c317c31d165f0400c04222800600000000e053f1a8a95a0ea03593e804ebc39531290feb2a15da8eb5d7d7a56664b97a47fd7b9ff7721bdd7e948926a261b69bafe864bca7c9e24b0100581804d000000000007c42727e0ff0b43218135ff8cdad3dffc67877d3ccd48074feb307ad8d195793ecdce79a382bf059619bb2f5586f49f1cb914e8b2f0800605e11400300000000f00979d4541db2ce49211df65a6613b17e4feed180aea25b8d97b3a237ba78afb0558892637f75cd74f1cc71f72ff48aa88abf28dc381d2afe98beeb94f84839868edb74505ce5f5449fc5970500304f08a00100000000f884cc4c0d9486c4cb2970fce643d96ebee1dfef3672f372f03f775cde7346f4d053523cded5f8667296cad1af9ef68eb6d4b65dcf2ff68bbeb8fd44c0575bf56ebbae4fcbb4f8ca0000e603013400000000009f9617c31de1ebf748e16fc8da1d2dd9b9c3f55555b1a9e93b4f85eadb1ced65651dbc667b9ad3c9ca9894a19abb53fd2db3e6ceba5e4ff44df4340f549495855d48b03ee2bfcae1af4b58fd2f70f5b6d290f8b1f67a8b2f0e00c0bc08a00100000000f8e454c55ff4fb628b94ff66389f9d1eed7efb6e7374ff93b6baea84f4a89ff66916cab8e51df9f87e8df8d45c57ffe371d7605579faae535ecbfef632c3f8cd6e031565165f1c00801911400300000000f0c9991eedced8774e8a7dfdbed8521993a275c240455955fcc58aa8a4f9db953c3335f0b0aef2d2eed3be9fd9cb19b418cc784f93c5d70700602e04d000000000007c8aead332e5d837d9c1c352c378dad9907dd84f731f745d6a86c5170700602e04d000000000007c72de4cf6179c0d93025fefe536374e876a9df07ca8bdabb0b0f3e6cdd7137df3378ce9d1ee3be10972416a6930c3f555165f1f0080b910400300000000f0c969cfcf0ff9f37d83893647e4aa177f3ceeea2b2bc93b1ee4b3c256fa34eaa77dddc5452f863bcc78f599a981a981d6a68cab216b7768ee7d0efee78eaaf88b165f1c00801911400300000000f0c949753cee69f521f69532df978f3a6b932fc7fdf790664566b92e73fce64375a919d2bb0a557a31dc511c1013bdd145eb0d84e77fdedf5150f066d26caf3a04002c0604d000000000007c5a5a73f3e4d837c1faf09df0844c174fbf2fb668e5cebac43919ce672ba292ba8a6ecd298c9e1a686dcfcf2f098e4b753c2eefad96057de378dd23f0e548a7c5570600607604d000000000007c4226fb5ba27eda376bd09c607db8d02b22c3f96ce0ea6d864e8bdee892e9e2591e9958979ad15756a2451c2c098ebbbce74ce89fb53e7489ce73dcfd1fdfafb1f8b20000e609013400000000009f90ca98142f2b6b85e839ff64c883ca3b7f3cee9a7936f0ea69ef50cddd2c572fdd6dcb2a890bddf2891aaeafa2e606002c6d04d000000000007c2ac6bb1af546c97e5f6cb97ac8a729e3eaf3a176bd0dc5f1fab4cc1c77fff0ef777b2fb7312d74160d237fdc7bdd23b03d3fdfd08500004b0c013400000000009f8a079577b42a6024d91fbd1d18db5b7afbf9c3f69967030a6dc5a72f473a87ebabdaaee79786c45fda7dfac2ff0e476f7409fb7697e8c77f9583fc5241f183f8a338283e3afff3fe445bf72c57ef3be109a2e148e3bd978fa8f50c009f10026800000000003e155303ad216b77485b9e2fed3eadb0e5d918a2ed707d55777191e8a73e2db33c32b134245e103f883f8a83e2a3474dd5737a5d2100608921800600000000e013f26aac87501800b06008a00100000000c09c3d1b6c7b5075e77e764e53c6d5de92e2a981d69929a50a1e00804f1301340000000000989bf1aec62c57efe035dba5a2cf3e2b6c339ccf76151692410300b4104003000000000063bd9ee86bc9ce950a496bf159615b121c274eb0f82001008b070134000000000030565d6a86bcf15997d7329baad8d457633d161f27006091208006000000000046e9b851e0f7c516396e4eb273af4db97c3f3be7ea211ff9a0f7729bd290f83793fd161f2d0060312080060000000000b37bd4541df3cb013968ce76f31d69b827157d7e3ed856e81511b87a9bf451f8f7bb9bae645b7cc00080c580001a0000000000cce2cd647fa68ba79c3e476f74991a68d53c617ab4bbe06c987c42d4bff78923161f3600c0e208a001000000008092574f7b2b6352e470f9c26f6e8f9aaa754ffbe3715786f359f9b4f49da7c4118b0f1e00605904d0000000000040c9404559e4066729560ef86a6b63c655a9f286aed1d6bad0754ed2997e9f6fb97f35c7e28307005816013400000000003068666a20ef7890bcaf39ef44f0cb914e85f36f07c6faaeb4934e8edce04c210e00f8c4114003000000000083461aef85acddf161fbf3975bb54a3feb9a1eedd62cc451157fd1e25300005810013400000000003028c7dd5f4e932b63538c69d29e9feff7c516a949ecafae169f0200c08208a00100000000807ec3f55572fa1cb7e9e0f3a176635a4d8f76df3c172e37ac884ab2f84400009642000d0000000000f4f8e371979c237b5959375cca9a79a6ffdd83ba86ebabe44dd031bf1c98ea6fb1f87400001641000d0000000080198cf7340dd7577dbcc6daebb566d45d5c2487c8719b0ece4cf5cf69418afda23f84d7cb6c1a2e65697dfa62b8c3e25356c9e28f1c007c1408a00100000000502bc3f9accf0a5bb9e8c4c7c8cbca3ad5f1f89bc90f29b3f8e1ca012fe9a3c0d5db1a2f6b27c8b37adad910fedd2ea98790b53b5e8e74ca1f9586c4fbaeb4b3f894554ab273d74ded01005a08a00100000000506b09c4a99eefb72a4f0db44a33ea2dbd1dbe7e8f743c7de72923ab3f6b7a33d177fd5890dcf9fdec9c99a90f153c2e3a1eb7f864cdb05c56d62dd9b9167ff600609123800600000000402d8b87a16611b276c7f468b734a3eb1e815e56d6d2f1da94cba62dcb587bbd1ccd67389f95d3ed6c375f8b4fd62c4cd8180e009f1a02680000000000d49213c9b84d076f9e0bff185544253d1f6c93a6f362b843aefe1cbe7ecf7857a3c92b23d7f1109aae64cbfdd7a566587ccaa6b9b8fd04013400188f001a0000000000b5e444f2e6b9708b0f463d310b7946b94703e4d2192668cfcf97bbca7439f77aa2cfe2b353a9f17216013400188f001a0000000000b59652003dded528577f0ef86aab5c37c3346f26fb2337384bbd05aede266f82fe78114003c09c10400300000000a0d6520aa04b82e3a4b9785959e71d0f52df61e7cd9b3e2b6ca53e931d3c2c3e419508a001604e08a00100000000506bc904d0d3a3dd81abb7c9d59ffbca4ad4f7f96cb0edfccffba53ebd97db8cb5d75b7c9a6a104003c09c10400300000000a0d69209a09bae64cb73c93b116cae6eeb5233e46eaf1ef27933d96ff1999a8c001a00e684001a0000000000b5964c009de9e2294dc4ef8b2d1d370accd5edcb479da1eb9ce48dd5e35d8d169fa9c908a001604e08a00100000000506b6904d0af27fa82be71942692e67472a2b7d98c9de7b8fbcb5538ba8a6e597cb22623800680392180060000000040ada51140b7e6e6c913a94bcd306fe71d370a42fedc04fd51af12013400cc09013400000000006a2d81007a66aaffcafe0ff537bc96d98cf73499b7ff97239d290e1e52ff49f6475f0c77587ccaa6218006803921800600000000402de303e891c67b4d19571b2f672d069aa5305e8e74c66d3a28cd22f2c7bdf3b14a6271a4fea37eda375473573efea8a9dae24b21eb2929569e05013400cc09013400000000006a1919403fbe5f239fb948c86f1a7cdad910fedd2ee9e08dd3a1b34e797ab47bbcbbe95153f548c3bdb18e863f1e77cd4c0d283769ceba26f51ff0d55639ba1daaae88dae06cf175d0d49697af300b0268bd5e0c778887a1aface44155f993b6bad7137d161fd212f6f251e7684bad58edfe8a32561b8b1f013400000000006a191940cb09ece2511676411adb48e3bdc0d5dba483ca05a01f3555df0e8c8ddfec16b17e4fd0378ea255d8b7bbe2fe7be89abbbff2db057b4b6f4bfdfbfcc3ae2a36553ad878392be0abad165f074dca3791005a57777151cc7f0e067eb3fddcff597bafb00b5eb733d3c5ebd9609bc507b62489d54ede7a2ce89f4e62b53d97d9b2da58fc08a0010000000050cb84ec723188dce0fca8a95a1adb707d951c04771717698dfccd647f7f796971404ce48f7bbd97db28f419faaf9dd73d025b73f3a647bbb53ae92b2b914f2b0d89970e8e77355eda7ddae24bb1040268b1bc62558dd498912d8826a32db5afc67ad45cb7a3a0c067a5fdb9ffb3d67271c7c9f19e668b2fcb126368b5c3d7ef51b3da639d8d772212759f930755e5169f32960002680000000000d43221bb2cf68bee2b2bb1ac91c67b72dd8cc72db5c1ffdc218d2def7890f48ffadf4cf68f753434a45fb972c02b62fd1eaf654ad1b3cccbca3a78cdf68b8ec72b635286ebaba47c535ca83a215d3ac1f733fbeac47479599e7636587c2934c3f18f34802e0d89d7cd250d0958ed2884afdf73fe17d744bbdff34f873667e58c34dc9b9e6318fd6cb02dfe7f47f45ec2f77307f9af1960160aab2d88d59e7ea2fdb73ec6105ff3e280584f2b1bad0ec58321bebf169f35960002680000000000d4fad8b3cbb7ef6bf8c6fec7551a9bcf0adbaaf88b9d376fde094f48b439a277cb73c0575b931d3c72dcfd8534a79341df38ea0da3c3bfdf7dcb3bb2abb050cc37eadffba483113fec1da828b3f89497d84d9c5300adcbd3ca26fc87bd85de517d6525c65f74a4e15ec06a47437d263b1cb3f8b22c25b3aef6d3ae26d3ba8ddab85fb7c38e8282590bbb03c62080060000000040ad8f3dbb94f496de562eaf21c46f3e541c10d35352fc66b25fabf9684bedbd0b694976eebe9fd92b7752ec176df1c92ebd9ba83280d614b7d9ad3123db98d21cfde5a5ba3b6765913fedb3f8b22c25b3aef6c89f1575e624d9e1985657de2becea52332d3e5f2c1904d00000000000a8f5b167979299a9fe5bde91ba7536bc57d886afdf93e9e2d99471f5495bddaba7bd0a9d3ced6c68cbcbbf713af4fccffb7d56d8ea56e748dd766cacbddee2935d7a37d18c01b410bcd6e9fa89e0e70fdb952f3ad2a8b427f7e28e93165f96a564d6d59e987b19e8beb212dda2d297769f99f5d603c62380060000000040ad8f3dbb944d8f76df381d1ab87a9b3ccec81ff7def28ed45b9661666a606aa075b4a5567737b4f0a8a9ba3c3231c9ce5deecaef8b2d992e9e8b337d5e0237d1bc01b4a4e05cc4647f8bc2455f0c7724dafdaeb7adefe70e15d1c9165f96a54461b505b1da52e976e3fdf1b8ebe28e935afd04ac76346d27356008013400000000006a7decd9a59657633d1d370a5ab2731fdfaf519a4ec6559f15b65ecb6c6ef944299cf67cb0ad35374f74287eb0f8d4147cec37713e026821d5f1c4b8e2beda899ee6e0753bb55a792eb3cd3b1932d73c14b3fab0da56daab9dec70cc84d5ee2abae5bdc24eebded5245db2f834b1c410400300000000a0d6c79e5d9a26f76880fcd2428b0f46bd8ffd26ce5300edb5dcf6b2f339e54b8f34555f71f5f6fd6c8bd42478ddce8ae8e417c31d165f932549ac76fee9d0c0afb76baeb60915335e4ff465eef7d2badd0936eed34fba2d3e472c3104d00000000000a8f5b16797a6c971f797a763f1c1a8f7b1df448500ba323675acb351d348c3bdaea25b15d1c997769f51282b2cbb1d18abb7d08a16d1f3b3c5bdcf7d2911ab3dd17bdfe4e6e219283817917dc45f76fd44f093b63a8bcf0b4b0f013400000000006a7decd9a56908a017d54d5408a01b33b2f53699991a98ec6fe92b2bc9f508f4ff6a9b42001dbc6ee7607585c5e708337a35d6f362b843d3cb479de291b0f8c0b0f410400300000000a0d6c79e5d9a86007a51dd44130268d99bc9fea62bd7e4aa0e7aa5ed3c65f13902f81811400300000000a0d6c79e5d9a86007a51dd443501f4dbf7bba1072aca745f49a7499ca0dbb0e1f25571695d15d1c9230df77407a957d585b4670f5adfbe2f4cdc515070e58077e8b7bb3cad6cbc96db466c70be1d18ab30f2c9fe96969ceb792743d29c4e85ffb0579a826818f6ddee0bd647728f05355fcd517e8fa2b289defbcd59d7ae9f084ed9763cf2a77d7eabb68afe7d56da8b6bc5ff7638639fa718bf18f3abb19e05e8d0d06a0bbaabadd79bc97e711fef9e4f111712eb232e2add5c310cb1d4495b3cf24f878ae1195fdca3afacc4d090ba8b8ba473c45cdaf36f641df23dff8bab3c5f31f7f45da7ef44248e7536b2f37a6923800600000000402d0b6697335303133dcd5d45b7ee8427e4b8fba73878a46e3b96e9e229fef8a0f2ceeb89bef99b3501f4520aa0dfbe7f9644270a197471408c6e2a9aec704cefc901ab1d75af6ba8e7f01ff68e34dc7bfeb0fda66764f0ba9d5a9fa63a9ed037dafe276d7562c08976bf07add9a1909b077eb33dfeb7c3f712d2c7daeb8d5fcf996703e33dcd95b1a971ff75532e93edb5dc568cf9d2ee335517d2142e61960e0dadb63177f9d9605b4bcef5ab6e7e62b5bd14ffa6410c4f0cf24e44e2c3daca597f87283c7885de51e204719bc44583d73ae93d473c6f719bdd4c7b8f223e1604d00000000000a865a9ecf2d5d35ed1cfc5ed277c57dac93dcb42d6eea84fcb9c1eed9ea7595b36809ee86d1eef6a944d0db47ea437d15cd407d0c2b307ad511bf71bea27d1eef7b1ce46ad26e60aa0072aca0c4de1d2ee33ba43ed29298edbeca690a26af1b4b211e31f69b867e466dbbeb2928b3b4e1adfbf141c5fb03ef2b0b672fe3a3439807e36d89675c857da7d6cbce89f0fd4245d32f9c12bf48e7afeb05d61cc3231b0fcd3a116ff12619e10400300000000a0d6c267973353fd8fefd7c46d3aa89b3b6bb91d10334ffba0172c807e33d93f35d03a5473b739eb9ab868d44ffbbc96d9e8ce541c141f8913ea523306abca4513d17031df44f3324b002dd4a5661aeac77b855d4f49b1d6f96609a0233638e79d0831f469f6117fcd4ec4c32f26abfcd6444302bfde5e9f7e45f9c178f9a8b33236d584ce2545bee7e7af431302e899a9819edb45913fed337900e9bbcf480552e6fae05d3f1e7cd9f99cf117125ff0397d67f1b12080060000000040ad85cf2e9b32b343d639e986b03e2b6c05cd23416bb6cf534eba0001f4abb11e31f84c17cfe88d2e7e5f6c99356d97f9aeb4134d4443d1dcc8e2bc04d09297239d0a5538aa13d3b5ce374b001df44fa7c06f0cbe025133809e99ea2f8f4c52ae55ad2c78ddcefbd9b90a2b70cb274a4dffba3ba0cdd8a10901744bcef5f0f57b4dbefab9f79bc7b30efa182a91a1f0e0456ed8a75ceb434beca643a3ad7516ff2ac1ec08a00100000000506b21b3cbe9d1eeaaf88b5aa173b69b6fcbb5dcf1ae77e51166a6061e3555877dbbebaf0cfa1bc7895ed35fc266c8fc05d0628e627dae1ef29953e86c88e8e4f29e33a2c3c9fe96457213e783b90268e182f511435d15f9696fef354b00ad4cf325847569577c56da1b3a537c14bbe950aae389e89f0f2864be416b76187a2da158c6b9d6a9d014f6ddee79ed70ae01f44853b56e4d6d1388c5d4da876ecc836782cad8548b7f95607604d00000000000a8b590d9656df265798fb3979575aae371cd3d832f863b2aa29242d6eed00a61335d3cd55749d662f6007ae6d9c0647fcbed8098802fb7eadfd7fc997df877bbe237bba5399d144b5d9d982e9651103f883f66ec3b273e1227188aad45b7a27371097121cbdec4f960c6003ae7f700435de9a6900b10408ba949cd1f35d7184c48ff612fc6a6f9770c631d0d37ce84792eb3d57b7ec1b908ddf2e883d515c66c55f659692f66a73756d65a1fb37738a7005afc3650f8bb0489ef675bc2bedb1dbe7e6fd03ff5bf2450eb12badf1df306d0693b4fcdebab53611104d00000000000a8b560d9e5707d55ec7f5ce54eae1cf07af9a853eb53efe57aea23fbacb0bd7b3ed9bcb3367b00fda4bd3ec9fea8eee0bd96d9446f74298f4c7c5079e7696783c26b15c547e284c17be53549974413bda5a2c525c4852c7813e7891903e8e28018435da53a9ed03a79be0368dfcfb648753ffe78dc55702ec2d069772212756badbc9ee81373d19b4107add9315051a679b2e87fd6d7e585afdf53199b2a9ec391867b0f6b2bbb6e15de381316f1a3b3f4a9dfaaadb52919f3d7a1c26aebbdcbf5e9595ecbf5e7ef92cbcee7fa2bcac63a1bc7bb9b465b6a1b2e5f952fadd7f95f5c758b41cf1a407bafb0bb7e22b8a3a0a0afac444c56f9d591d11bf78f34555bfcdb04f32280060000000040ad05cb2e73dcfdbdacaca51e2eef392347b1e287db81b15a3b7f7d56d8a63a1e0ffac651fa63c8da1dadb979669cb5d903e8beb212ddd2194d57b2c77b9a4ceb503414cd45275a2b232e64c19b384fcc18402b7495ec704ceb64f306d0a255fee9d08e8282818a32a13e3dabe05c4457d12de9f1109fea6d95e674cad05c145260d1b3e699fde5a5be9f3b181a58f0ba9dd589e9a237dd4b4c3fe9ee2929be607d24e6d7838f9a6be6af4385d5d6bdcbafc67a148a6ff8adda2a565577afb138927dc4df502b4f2b9b9aa44bc63f2dd285b4be6e62ca59877c159645dc7d8b7f9b605e04d00000000000a8b530d9e5f468b79c2687ae737a58f7e1d5642f863b728f06fc55b6c2ea7fc16bb6e7b8fb77dd2a1cef692af63fffa16487d5ffe2371fd2dc31ad92d903e8a79d0da98ec7e53e43ffb5b3bfa2547db7fde5a5a11a2f6c14971017b2d44d9c3f1f7d006df56e3b706761e1f493bfed70174fac94d2de89483474a1fa74a51b71f77c8a81b978687e1dca23930c8dcd7b855d73d6b569c5b7598eb6d4b6e5e56b46ba66ef5061b575eff2404599c1abffc35eacc9cc949e4234c244effdf3bfb81a6a9b647fd4f8a7c57399adf854f74243357783d6ecd0dbc4ffab6d0d97af5aea4b847942000d00000000805a0b935d76dc28909be7b8fbbf99ec7ffb7ec762916f94e6f6def8cd87ee67e7c8adc6bb1a931d3ce44fcb23130d054f73351f2f211caab91bb87a9be79f15aeaf1cf05228b8610cd13cd3c5531ea7e85c5cc2823771fe9831802ef48e32d495ee5e637305d0815f6faf4bcd343424f1d0a6ef3aadb761d4c6fd230df714a6d35f5eaab7bc72e44ffb1ed656caa765ecf33434b64c172fe9eb362766ef5061b5b5eeb258ae8ae864436746ff7ce0d9609bc2559ab3ae29d4ee7831dc61e48317f44fa7d1965addfe5f3eea8cdd74487f38bec28ef7102e3d04d00000000000a8b530d9e5758f40b9f9a33fcba4d6245d922b1d7b59595f3be2a7150fbd7d5f1bda77a59de79f2fe2d35b80c204f311400b43d515c16bb6cb3ddf381daa3b2323898679c783e4ae82d66c179d5bf626ce1f3306d059ae3e86bacaf508d43ad95c01f465e7730a6f9f7b3ed46e685b6ef8fa3de5914995b1a986147a47057ebd5d79844fdaea0cf52f4e1b69540ab8f5327b87caabad7597c57229dcc48ae859cac14f0db446fddbc55073ad5f200a0f5edc6637bd35468434a753865ac9ef9cc49241000d00000000805a0b905dce4cf5cb2fe80bfac6513a38545d2157370ef872eb2def48ddf7b0498a7ca3fc3eff7066d44ffb26fb5bd4cf7a9e026831d3ded2db216b77c895acf34e043f1f6a973e7d39d239d270afabb0b02afe624970dc8dd3a179c783c40fe28fe2a0f8489c206df1164d723d023f941f795f02bbe15296e8dc8237715e9931808edab8df505762a9b54e3657002dbd69d090f1eea6f0f57b159a9b4073b3ed404559f80ffafb8ff9f5a0097f0562f60e95575beb2e3fed6c4cdae261e8cce1fa2ae5ab28ec37179ab3ae19f9e065ba7819ba84f86e12407f3a08a00100000000506b01b2cb3f1e77c5fdf790d436fcfbddd2c1bc13c17287d78ef82954ab98e86d4ed97a4c3eb934245eb9feac31e629809654c55f940b5efb7db1e59677e4f3a1f6a62bd9e2a211ebf7782fb7d1ac3a221107c547e284bad48cf1ae46d144f3dd83a243e56a1e04d092a75d4d0ae51774ab64982b8096de3468c8684b6dd03f9dcc1b406b669d6d79f986fa4fdae26142d51ab377a8bcda5a7779a4a93af2a77d86ce34e6420a6558b44a64283c78a21343fd13407f5208a00100000000506b01b2cb978f3ae3361dd40ca0c51139608dfdd5556fad55d9f458cf8dd3a1f2d5a33638cb453c4c36af01f4dbf719b4bc7f590dd1c92d1f8341d842dec479659600facd64bf423218b0da71f09e760d13b304d0e13fec55aee32c3e151dce5f002d866aa87fddf72e1ac3ec1d2aafb67600dd70cfd0fe6bf501b456404c008d5911400300000000a0d60297e00859e7248e54c5a66a6eef557ea79938c17f95837c7e7b7ebe42310a23cd77003d3dd673f5908ffa005a7462cc766f026861b4b52e78adc18dc6a98e27c67b9ab59a2c4c003d1f3ba07d3fdb22d7fd50d8b09c60e3ae509cda10b377a8bcda730aa09f3f6c9ff54239bf07186ace0e68cc15013400000000006a2d4c7699e5ea2d377f7cbf26f63fae72858a97239dca6da3febd4fde0e7c273cc12cb39eef005a783dd197e17c56b3e08698ac38521a12df79f3e6707dd57857a3207e107f1407c5479a6537444371c4c8b08f00fa5d9997cd6e0a896dd58534ddda110b13408ff7341b4a54c3d7ef117337414574b27c518592cd111b9c277aefcff57698bd43e5d5d6bacb62b9521d4f183ab335374ff92ad34fbae37f3b6ca879f3d51c231f3c02684808a00100000000506b61b24bcd2dcf374e87067cb955fa39ef78d0ac6de502d0c1ffdca1bef88664010268e1f1fd9a4c17cff0f57be2361d2cf48ae82dbd3d35d0aa77fbb638283e12271407c424581f164d4443d17c51ddc4f9a332807edad5a4507541f05bb5f5495b9d6ec38509a05f0c77c4fc7a506fdbb8ffba999ce7cac63a1b0df5effb8543b7627dea85e95079b5b5eeb258aeec23fe86cebce61ea0fc0f261e35d7286c84ef2f2f35f2c123808684001a0000000000b51626bb1caeaf929b07aede26ef68ee2e2e9ab5ad5c00da77a5dd6055b95966bd3001b43035d0da575632d65eaf7970b4a5561cbc9f9dd374255bfca055025b6a22febbd86ee2fc5113403f7bd07ad5cd4fe1dd8342ceef017adb2e4c003d33357071c749bd6d83d6ec68c9b9ae72f5de4cf6a7ef3a6d6878628eca89ade48fc75df3d7a1f26a6bdd65b15c15d1c986ce0cfb6ef75867a3c275455b4f2b1b43cd27fb5b8c7cf008a02121800600000000402db36797d3a3dde59189c90e1e374e873eed6c908fc7feeaaa55e0387aa3cbd440eb78576396ab77f8f7bb73dcfdf596e310970bf8eac38ee9bbd1c96699f58205d0b2b1f6fa8aa824b12cbe9fd9ebd67a1607c547e284e1faaac5701317980901f4647f4b5b5efef513c1de2bec14a26721fae7038676192f4c002d54c6a62a0c4f37abd56ba0a2ec695793de8f6a922e29ac40ae47a0c23eeb57633d457ee7d39c4e69d6c8367b870aabad7b971f35d7285cfdfc2faebae5bc25f5e9590a0d335dbc8c7ff008a02121800600000000402db36797ddc545e1dfef7e57c578856decafae55f1171fd655be1aebb9e51d298e68a6ae694e27df4cf6d7245df2fb7c8bb4c1b92c345e77e7ef605579e40667a949a68ba75966bdc001746dcae5b8ff1e1213d48d9eff1643afb48bf9e5800919d6120ea0335dbcee44246a2a381771e58077dc66b7e0b54e0a7b5d257eabb636675dd3adfe2c59b000fa415579e8b7bbf4361753c83f15aab74288447c7786ebabcac212c485728f05bd18eed03d479c10f8cd764323f459697f69efd9969cebe33dcdafdebfd37266aafff9c3f691a66a314db198e204d15cb33eb2d93b54586ddd005afc5a48b23faa705b2fee38d996973fd9df22ce9c793630fda4fb714b6d75627af0ba9d869af87eeed09e7fc3f8078f001a1202680000000000d4327b76d99e9f1fb2768766ae1ab9c1b9e06c98e85f2ebe21b91d182bceaf4fcbf45fe5206f04ce74f11ca828d37cf9decb91ce04eb23d209a267b3cc7a210368317ecdb70bceca77a5ddac2f669cef9bb8c014724035bc57d8e57a042a5c77c102e8978f3aaf9f0836d483a7954da2ddef2d39d7b5b642bf18eee8282828f23b1ff9d33ee94cff2fb755e8fb4700afc67a32f6792aaf86cf4afb54c71305e722c46a1707c4641df215dd6a962ed15c2bb377a8b0daba01b4d096972ffa57b8bab84797769f118b53121c977f3a3476d321e5322cf1bf1dd6cdee09a0312b02680000000000d4327b76f97aa2af24382ee81bc7599356a91f71beb8b4cfdf374707aede96e67432c7dd5f48b273d70c70c77bf457219893850ca05f0c77c8e30ff8726bfce643b70363dbf2f287ebab04f183f8a33828bf98d177a5ddf468b7656fe2029b8f00da7b85dd4daf48cdbfc9d0b56001b4f0a4adce6fd556e5317b2eb38ddeb83f6eb39b10be7e8fa1798db6d4ce3cd3ded33dd1d32c86ad66c5a236ee9fd70ee714404f8ff55c763e67ae87c167a5fd037de5e309a0312b02680000000000d49a8fecf2f578efc3bacaf45da7bc96d9cc1a40bf7d1fd1167a4518b941b8b7f4b6fa592f70098ed69ceb4976ee79c78386ebabf416fc1507c54762112e3a1ebf77216d31dcc485341f01b4e8536fb50a4d0b19400b35c9973d9729edd23552faaed37a8b20df3d9f326bc6adc0d3ca46ab04b9793b9c53002d3c1b6c3394c2cf89f70abb827311737df008a0212180060000000040adf9cb2e67a6061e35559786c4273b78686d7096d4a566689edf9a9b17bfd94d397d0e5cbdad3d3f5fe594a7065a531d8f2f6400fdf1dec48561de003afae7033549978cb9ee0207d0af27fa2a6353952b4518435cb1afac44b7ff3793fda27f3591b156ea6ade0ee71a40bf7dffdec5d84d87d4ac95a7958d1883a1d73c1240635604d00000000000a8357fd9e5eb89bec7f76b6a922e25d91fd5bb15faba47e0cc54bf7cfeccd4c0684bade83ceaa77dd2093e2b6c237ed81bb7e9608a8347b69befbd0b690377cb0c65494612a32a381ba659d3c3e2b76031dfc485619600dad3ca26ecfb3d05e72206ef552857de902d7000fdf67d65895bbed1c16b9d4c9ba3f70abb985f0ff69595bc1eefd5dbff8be18eda940c8577f1292f60ae47e09bc9fe79ead084005afc4ee82f2f4ddf757ad6b74deae5ffe536f13c3c7ba0fd5e53631e3c02684808a00100000000506b9eb2cbf19ea64bbb4f07afd9aeb09d39fcfbdd4f3b1b75dbcaaf1c0c5cbdadc837eae548a7562866b257633d55b1a95e56d69ac3b0f82d58b43771c1a80ca03d97d99effc5b5392b47efe3a460e103e8b7efb715f7959544fce83cd76906afdb59119dfc6cb06dd64b0cd7575dda7d664e9d077ebdbd2c2cc1d0db2fcdd2a10901b4e4e5a3cedb81b1a2c3390d20c9fe686761a1e65f71cde9c123808684001a0000000000b5cc9e5d4e8f7697855d08f86aabded0591c0f59e72445c0e2bf0de957749b6b3549b273efb851a03e83163d544425792fd7de8b6d7c0faf27fa461aef75debc599f9679273ca134245e52199322d6441c1f6baf3772efed22bf890bccf800da6bb96df80f7b8554c71359ae3e457ee75b72ae4ff4de37edba1609a0dffef92c355fcdc974f10a5ab34361be9e5636c1eb768a9936675d9bb5a4b596beb292ab6e7ea1dfee52e8dff773870bd6476a922e19b3862a3b34398096880e45b78976bffbacb4571880b81db91e8162a8afc67ad43c7804d09010400300000000a09679b3cb574f7b738f06047ca9277d4e71f068cdcd1bac2aef2eba15f6ed2ee9e085dfdcb492e5e1fa2addb611ebf71407c4cc3580d372ef425ae8bf76ea76aed06466aa7fb2ef7e7f79696dcae51ba74393ec8f466f74095de7e4bfca41731bb5cf0adb80afb68ae3b1ff7115e78833c5f943d51562c03353031fdd4d5c784fbb9afaca4a8c21eec548c33d61bca7f9f950bbcabf96100f9bdeab0c5494e9d66d3034a4c17b15d3a3dda60d405c65a8e66e6d4ac64dafc82b07bc931d8e4932f679e67a04964726ddcfce7d585b29663af3cc9407493c810feb2aeb5233c5d727fb88bfd479aae309d1f92ddfe8aa0b693d25c563edf5c63fa56a3a34b4da8242950c4da2dbb1cec6ded2dbe24285de51f28abd1bc0b1a092e0b8c68c6cf16cbc7ca47f1ff79c1ebcb18e0643ad465beb0cb5121daa7920b10811400300000000a09619b3cbd7137df7b37334b3dd90b53b82be719437323fed7c97e9bc99ecbfbce78c7ccea3a66acd4e5a73f30c95ec28381b667201e8a1ea0a3118b92bcd7dd0869a0cd757954726a6ef3ca55930da78e272d96ebed589e9a32db51fd14d0400c808a0010000000050cb5cd9e5ccd4404dd2259f15b6d2395e56d6d96ebecf07db44b79e561fb6097717dd924e7e507547de415c1676e1cd9f652b4427e28ff2b6e2b2d0f8243b77cd54f7c26f6ecf87dae73ac7c7cd35e1dfed923bc93d1a90beeb94de005a0c606aa0b529e3aab8d0ac11b3ff2a8780afb68affce7a6682f591fbd939a2e7457e1301009a08a0010000000050cb5cd965576161c4fa3d1fd2e76536570e784935589bb3ae057dfd6113f42def48e9e499a9fea80dced2c1f8cd879eb4d549c75f0c775c3be2271d8ffc71ef48e3bd97239de77fdeaf19e6e61e0d786ec47bd864af27fa627f75959b877fb7ebf9507b8ebbbf6e002dae5e12141bbdd1c5508eecfb997d9ad3c992e0b8b6ebf97d65250feb2a87ebabc47fc5cf4d19578bfda293b71c15e7e86d2bd644f42c966e3e8a44134003c07c20800600000000402db3649763edf561dffe555e39f768805c15f7f9507b92fd51e978dca683e35d8dd2f1d29078f9fcda94cbd2c1d1965a392cce703e2b6d190eff7eb76692ebbddce66e74b291b37b39d2f96e0bf69f6da3febd6fa0a24c1cd71b4067bbf96a56769603ebeb1e8175a919c3f555c65cf1f544df6055794dd2a52c576fb9fcc85f31b495f5bd0b698bf3260200b410400300000000a096faec72b2efbee6aee16c375fad5a13e591899e7f56d5b8139e201d7cd256e7b5ec4321e634a793af9ef6be7df79eb7db72118f92e0b899a97e715c773771f8fa3d0aaf0893cd3c1bb87b3e596e15b87a5bd7ad42e923bd01b41886e6552e6e3ff1a0ea8e1883c96bfb7aa2af35372fd1e68866b7058aeb6ca99b0800d045000d00000000805aeab3cb8c7de7a42acf52c83bd9dfa2d576e06e995c9822c9ce5d3a38333590607d44de65dc53522c0e36a45f91afd29471551c19ac2a978f84ae7392f71117f946cf3ab5a79d0d113fec959bd7245d7a3dde2b7da43780ae4fcb14e3978fe79f0a51bfbccf07dbe4a222efa6f0af9d238df716e14d0400e822800600000000402d35d9e5f4584f4554926640dc9a9ba7db767ab45b731770d79faf22ecbc7953deef9ce3ee2f8e6896cb904a5e54c55f948f74dc28d00c94956b62bc99ecd7dcd17cf5908f38227faa37807efb3e01f7fb628bfc5159d80535259b5f8e746a5e2864ed0ea900c8a2ba8900004308a0010000000050cbe4ec72e6d940cbb55c7957b2df175bca2313a54a1acacd2fef3933fdfefd8493fd2d72ed8ef0ef764d3fe94edf794a2ed6313ddafdfc61fbd5433ed291a06f1c5f8df55427a6cb659aaf7b043e1f6ad77bb93793fd6dd7f3e5121f31bf1c78dc52ab7982a100fae5a3ceca9814b961e0ea6d35499766a606742f2186f772a453a237a416070bbd22fc5739485df97e663f1fd59f55de4400800202680000000000d43239bb7c36d876e13737f9608ebbbf3862a8f9eb89be90b53ba43303beda2a6d049e991ac83b11fc57cd8d2bd971ff3d24fd1cbdd1459c30d2782ff2c70f5b9e531d8f4bfdc847443ff2666a2d63edf509d6873dff7c69a1eebe6c4301f4dbf7e1f595035e72cc1db87a9b18ad9c414ff43677debc59199322462e3a91dcf28ebc77214d0ce6c57087749a385f4c475c5aae1922ced7dc82bd486e22004001013400000000006a99965dbe9ee8cb3efc5769e3e88d2e72f66a486948bc5c70e3c26f6ed25ee9b1f67a39a50dfb7657d09aedd2cf374e87be7d5f94f94388acf1f64271f580afb67afef99ec0e9d16ead0bbd99ec974b79782db3b972c04b77300a01b4f06aac47b4924f08ff6ed7fdec9ca62bd909d647e4cdd17a894fc539cd59d7ead3afc865afa5cddaafde6ffa5e5437d1e2cf1e002c7204d00000000000a8654276599d985e159b2a47b151ffdea75c8e5932d1db7c71fb09b9939aa44bd271cd83f27ee1f6fcfce9d1ee4bbb4fcb01b77c09715c7ead9fff2a073112ad0bb55dcf0ffb76a7744282f5e1c7f76b7407a31c400b2f863b325d3ce5737c3fb397f744cfca7bb98d9c3e8b1fae1ef2d14dc92d7e1309a001605604d00000000000a865427699e9e229d7d3f05e6ed39c75cdc86b894e7c57dac9b1b514cb5627a66bbef74f8a951fd6557615dd9273e42b07bc34eb57888f34fbd12ac19cea785c0eb2e5985bcbac01b430da521bb9c159ff4e672beb90754e09d687931d3cc47f83be7634144fa7ef3c35d1dbbc086f22013400cc8a001a0000000000b54cc82e653effb0536ea5e5e5a3cefc532172f36c37df574f7ba7065a13ac8f68761bb9c179a2b7597efda0f7729b966bb99afd4c8f76cb29b370373a79e6d9871acd5d45b7e4e3b1ff71159deb1d893101f4dbf71974c4fa3d72e81cf6edae4c9773622974eb8d8cf73489e36254e21cb9e734a793e3dd4d8bf326124003c0ac08a00100000000504b4d009de67472d6d2cf5ac6daebe5cdcbe287ba8b99e26071408c66b7893647a6fa5be46dd1c90e1ee35d8d5afd3cacad94cf3ffff37e71fedbf7c1748a83873119ab9101f4ccb381e1faaae88d2e31bf1ca88c4919eb6878f3f7ddd65ac4a7e29cbbd1c9513fed4bb03ef2b4b3414ec617db4d248006805911400300000000a096c90174c8da1d7a4b3fdf381d7afeffedcf703e6ba8f07173d635b944b2cf0adbd6dcbcfef252b9a687907b3420dbcd57332a9d99d213e38a4bc87b934b43e2c591f6fc7c39dd8efdd555613a4606d0baa6c77a06abca6b532e179c0d139d488afda21bd2af0cd5dcfd886e22013400cc8a001a0000000000b54c0ba07d56d856c6a4686d07167fecb8512045c05e56d6f5e957f476f5c7e3ae1ba743e5a2c951ffde579f962917dc1072dcfd03576f937e0efac6f1f950bbde7edaf3f343d73949a789f3c7daeb93ecdc3dffac225d157f51613a730da0df6d6d6eafaf4e4c4fdf752a7283b356d16a21e0cbad513fedcbd877ae2e3563bcab51b362f5e2bc8904d000302b02680000000000d43221bbf4b2b24e753cfe5aa718c550cdddd85f5de5d3329ccfeaddb92cbc18eed03c33fcfbdd992e9e7ffdf1bb0f6594bd97db5cf708d46a3b3dda3dd1db2caefeea69afe646e92c576ff9e7243b7743d59f25730da01f54de49b03eac5b8444af64078fc1aaf2457e1309a001605604d00000000000a86542767971fb8989de66ad1386ebabe2371fd2cc61a577091aea706aa035c9ee77e524377de729cdedcf2f473aef8427047cb5557c14b7e9e0f468f7c3bacac81ff76ab5f25d69d79a9ba73cebb906d0d73d02b5ae12b87a5b82f5e164070f316bdd0dd1374e872ef29b48000d00b322800600000000402d13b2cb7b17d2b43e9d1eedbebce78cf70a5bcd10d67f95c3507585429f238df752b71d936b7168095de7d49697ffa1ff27ddbda5b7d3779e924b3c0b13bdcdd3633da521f15a0d53b61e1bef6e529ef55c03e8ea8474311defe536e77fde9fede6db947175f05ef9587bfd7857e393b6bafef2d29aa44be278c4fa3d5ecb6c02576fab4bcd58e43791001a006645000d00000000805aeab3cb99a981ca9814bd21727d5aa6f2d5c7daeb931d3cbc97dbe8b6bd139e303dd623ce793ed42e7e0efb76a7d6f66ae92587a2079fbf07dfd589e9864a7fc8e61a40bf18ee1073a9884ad2fbde45597f7969796462d395ec97239d1fd74d0400e822800600000000402df5d9656bce75dfcfec3dffacda5c121c17b9c159fa639ad3c95907f07aa2af3c32517e9da0e0b5cc267dd729f1d1aba7bd0f2aef84acdda1992ffb7db125cbd5fbc57087dc43916f94a7d59ff5373eb3d7fcc890b906d08b1c013400cc0702680000000000d452995d8eb5d707aede267f94b1efdcf4588f5cdcd9f7337bdd7715ea7a33d1d7722d57eee4c26f6ecf06db5e0c77dcf48cd0ec5caabcdc79f3a6b4f759d677a744de439dabf3d242bd08a009a001605604d00000000000a8a526bb7cd25697ece0211fbfb4fbf4d440ab382eba920f0e56951b338cbeb212b9495d6a86a0557323e0abad25c171cf06db74dbca69b2ff2a07232f67a900faf544df784fd340459998af4c8c591c3426a99f8f9b08003084001a0000000000b54cce2e5f3dedcd3b112c6f3d8edee8d25756a27b726dcae599674a15995f4ff43dacad145dc94dc2bedd19f0d556f98fbe9fd9a7399d6ccdcd7bf5be24b49697239d015f7e38397eb39b31f537de2e6000fdc7e3aed196daaea25b55b1a9e2a249f647e3361d8cf8616ff8fa3db2c80dcee2a0f8489c501e99d89e9f2f9a88860b701301000a08a0010000000050cbe4ecb2ee62a6ef4a3bf9e083ca3bf2abff866aeeca859b73dcfd95dfc857e41ba555e559abe273c78d0285345673607722128c9cf50204d08f9aaac59226581f51989d21a289682856467432af371100a080001a0000000000b54cc82e1bd2aff49414fbacb09577286ba5995303ad19ce67a54fa3febdcf508afab4b32165eb31e51cb635374f6154e35d8d720d9080afb66ad58656307f01f4587b7d69487ca2cd11796fb81aa293985f0e880e1fd6559af726124003c0ac08a0010000000050cb84ecb2e04c58929dbbf4b39795f58dd3a15a3b94df4cf69786c44b27f8acb0edbc7953b7c3c9fe9694adc7bc96d9c8fd24da1cb97721ed7e764ecc2f073cad3eb4bd1d186b68484f3b1b8a7ca3e55dd8992e9ec6cfdaec01f4cc54ff684b6da15744dca68372342f13d30c59bb23f63fae694e27f38e0789c5a94db92c9654103f883f8a83e2237142e8bf76ea361747a237ba88cec525c485cc721309a0a16c7aace7d983d6f19e6661a2f7fe8be10e3565cab1f8895fe3ed370a0ace45243b1cbbb8e364a177547bfe8d978f94fefdcaa780001a0000000000b54cc82e83be71947f8efdd5556fd9e5f6fc7cf99c8aa824dd13ee8427c827f8aeb4cb703e3bded3247dd4575612b87a9bf451b283876edb3793fdddc5454976ee9a59adb8a2f1b3367b00fdb4b341f37d8c32ff550e629cc50131627863edf5ca9d8813ba0a0bc5ca8826a2a16e6fe212e24266b98904d03064acb3b13123fbc699b08c7d9ea98e278434a75357ddfc0abda31a2e5f7d60dc7b3ef17111bf546f7a45fa7eee70eeffac6501ab1d8bfcce5b7c6c9645000d00000000805a266497b2985f0e0c5557e83d7f6aa0553e2dc3f9acee7b08cfffbffd72e98cda94cb9a1f4d8ff55cf8df61e9d3f0ef77cbc767a6069e3d686dbb9e9fe674523b99dd72744eb3367b00dd77a7c4cbcafaaf48fd33fb04ebc3cd59d74cde3f281a8ae6a213d1d55f3ba9adacc585cc7213974c00ad9997690aff61ef48c33d8b0f4f4bb2c33143036eccc8b6f8f01e3555e71e0b323442d9d3ae268b0f75a97a33d99f7f3a5477cdcfffe23a5c5f354f177d3dd157199b6ae8768b8fe4fafe9f2002680000000000d4323980f65a66d39c754da149e48f7ba533e3361dd47d0f61f8f7bbe5ebbe7adaabf9d1f387edefaa704825a437388b23d3a3dd5d45b7ae1ef489dee8a25ba122e0cbadfd15a5739af53cec806e4cb23f2af7296637eb7e67638cb6d6857dbb53ee565c425cc82c379100da22167300fda0aa3ce45fbbce59cd923e0bd4e2983f3d25c561dfedd65df3d6dc3cbde577cc62aca321c1c6ddd0ed8ef9cfc167836d165f194b21800600000000402d9303e822df28e51ceac6e950e9cce035db1fdfafd1fa54de011dfbabeb684bad7cfcd5d3de82b361f26ee277a5937f75950b3deb55ec17fd66726ed1cc7cbc8470acbd3e7283f35f61b1ddef5303ad6a3a14cd45277287a27343a136013401b44a5d45b782d7ed9c357a96587c199730dd27c4d3cae6966ff4bc5e74a0a2cc67a5bda1db1db466c7a366ed5fe09f0e02680000000000d43221bbf45a6693e67452b9dbe9d16eb98e73f877bb742b178bcbc91ddef2799765bf99e81ba828d32dafa1c4ea7f09d6874d98f57c04d0c293bf67d0570e78c985ade74a34cc703e2b7715b17ecf13c35baa09a009a0d57836d89668f7bb91e973f4c6fd165fc6a5aa3efd8aee825fdc7152f75f9018f2a0aabc3236552f851059b4f2ff729ba13b1ebcd669b4b5cee28b632904d00000000000a865427619f7df439a7b96f56aceba269f9fe9e2a9bb4379b8be4ab386c6a5dda793ecdc83be76d48e98ff2ef2c7bde1dfedfa2b96fd616f7f79a909b39ea7007ae6d9809897df175b3cff2cd97cdd2350739ff8ebf7217b556caa58ed8c7de7d2779e123f883f8a835aa78986f23670d1a1584fdd3ada6a6e2201b4452cce005a3c5d01ab1d8d0ca0e336bb597c1997a467836db19b0e69adb6dfaaad631d7ade3b6a486948bc090fd85867a3c2df40c4fc7a50ef9b663f1104d00000000000a8654276599f96a9dce7785763b28387e79fef18ec2abaa5f734cd521b86f87db125cde964b15ff4fdec9ca79d0d354997bc97dbc83d375d3131b39ba7005ad29a9b2757b8f659619be5ea3d5473f74e78825813399bd63b53714271404c5f5989682297ba163f880e95ab9d10401340ab917dc4dfd0a83cad6c227fda57e81d551a125f702e22cde994f8afc5977149aa884e16abadb9f801ab1dc56fbc3975625a003d3335207e4beb6de5b3d2bebbb8c8e28b634104d00000000000a8351fd9e5fdec1cb96a73a68ba7a152c8937df7b35cbde540595796abd74045d9446ff3ebf1de99a901d16de8bf3ebc91cf6b994d7964e21f8fbb4c9bf5bc06d0af27faee5db8e8fb99bdd4bf588aa89ff679ebbc3b512f715af8fa3df2ea894e8afdcfcfface370268026835145e4097beebf4707d95f404be1aeb99e8bd2f587c19979ef19ee6a0353bb4a2ffeb27825f3e32b6f886c4b400faedfbdf5ae55149d13f1ff05e612747cf31ff3958119d3c7f2f3ffc2810400300000000a096d9b3cb3793fd570e78c927b7e6e6299cfc62b823ef4470c40f7bf5a6b1e7ffdffe818a32e9cce1fa2ab9a8b47079cf99e9d16e93673daf01f4dbf725b0af1df133267156263a31669a04d004d06a88b53234aae6ab39165fb425efd558cf9d8844ddc217e297de5cbb3239807efb7e1fb4f8ca54c6a6661ff1cf3d16547521cd84012c3d04d00000000000a865f6ecb2f3e6cdd0754ed29961dfee9a75f7aea4afac44ee3f64ed0ef9e7f0ef764d0db4f696146bbedc2fc5c143654dd2f90ea02597769fd6dcdf1db87a5ba2adbb58e7ded2dbf2aef077b32bbd2d0e8a8fc409724d12d15034b7d44dfc881040ab276f7afd28d670e9991eeb1969aa7e585ba969b2bfc584aed404d0d08b001a0000000000b5cc9e5d66ba784a29aaf70adb86f42b460e4333806eceba16bfd94d731f74d8b77fbd7830d5f1f8c3ba4a95b35e98007aa2b739ff5448dca683171d8fdfbb9036d278efd5588fa193c547e284da94cb19ce674513d15034b7d44dfc8810407f6a6b080504d06647000d00000000805ae6cd2e5f3ded0df86aab745ac40f7bc77b9a8c1c8666003d5c5f355051a6b90f5a16b9c179b4a556fdac172680961664bcab51b38cc6d4406b57d12db18615514977c213c40fe28f9a65b2a526e2bf96ba898bc444effdded2dbf5e959e59149a521f1354997daf2f21f35d7689d66aef074bca7593c848d19d9d2e5ee442436675d13037836d836333560ae49cd5300fd66b25f7c6be4c1574427dfcfce357efae60da05f0c7788951403a8ba90260623889b28ee9df8e68a719afd39793dd1279e8abab42b656109e2aeb5e45c37a14af593b63ad1503417a315c316a31deb6c54b8efafc67ac41c9bafe6484d2a63533b0a0a9e7619fbeb4e77fc3d25c5e2f68959482b26c6203aef2f2f15c398536f960da0c58a89018b5f680d97af8a87505a19715df13d32e1f7f61f8fbbc4cabcfb6d99912dbefed2cad4a5668a9519bc5721beb0f33d1d09013400000000006a9931bb9c7936d07425dbc80eb56805d0e2486fe9edf0ef776ba6cf41df380e56959b65d60b16407f5899a981f1aec6da94cbb1bfba7a2dd3f3d24571507c244e302da45b4a01f4cb91ce8e8282041b77437521ceffe2da70f9ea8be10ef1bcbd551d9e3eed6aaa4e4c8fdbec66a81f21c9fe684dd225f98a6acc358036747ec06a47e9fc99a9fef6fc1b628486d6aae9ca35bd2fb22bf48e5298b2c2aaea0dfede3de1dd4d62950c8d4412f8f5f6eb2782c557dbc8d787ce7a734557ba4b242e21359f358d15c31eacae48db794af704cf65b6622e720d7ad9b3c136b1747eabb6ea6d229e5bd1e4cd6c7587c4432e7ecbd5a6645cda7d66d6358ffc699fb8a2f8cd60a89c9198af09b752c8f508943b51582b7175e5e98887507c8fca2393c4f3a670b9e0753bf34f85f694143f7fd86ea8abe743ed62652a635315be2932f1b5bd13996896bf925440000d00000000805a66cc2e9f3f6ccf76f395cef159613bd937877d88ba017459d8057933f58794d6ca3aeaa77d03156533536af7512e70005d9b72397cfd1eb9beb321e284d07fed2cf68bb6e04db4ac91a66a85e85953a2ddef3d25c56f5504d0d3633d95b1a9e2be1813d5795ad9c4ff7658f98d9ac6306f002da650e47bdef77307a5912fb3cd72f599d0498dcd1840bf9ee82bf23b1fbe7eaf5825633a110316f3125ff959974bf9e6b65cbb2ed641f753230368b17af5e959416b76280c55f42fae228fe7495b5df4c6fd6249159af8adda7acbc76062fbc7e3aeeac4f4f8ff1df1ff72db39ab39ac7cd03f9dc42d9bd657c3c7b201f4bbbbef7bdec8ef91e0b3d23e6eb39bf4e5d55a193186b8ffbabd5b19a3a7201e39b13277c213f4ae8c5910400300000000a09619b3cbded2db7e5f6c91ce31fe057a12cd00baabb030f76880a194d67bb94dc6be7352486db2850ca09f0fb5fbacb0558e9eb526289a58ea265aca9bc9feaab88b7af3444302bfde5e199baa9c51eabdd6ccd480f84879d7b35ebe9f3b641ff13772f7ae5e660ca0ebd3b3723d028dcc7c453f5ac51ccc1540b7e5e5c7fc7ad084ae84827311ca2f295518466d4a867800f47e5a1e992435570855c5ea894fbd962b45c912ff2fb789398adeba8b8b227fda67e4d42aa293a79f74ebce28d1ee77d3d64a221eda276d755a7d5a308036f9ee07add9d192f357b22f1e4e952b73d9f99ceeca9805013400000000006a9931bb2c0e88914e08f86a6b5d6ac69c86a11940c7fc72404e6cbdacac738f06dc381d1af6ed4ecd88367aa34b4554d2a3a6ea39d54a962d64003d3dda1db466bb3497f0ef77a7399d14236fb9962ba62c881fc41fc541f191b445da7f958366cde805be899652199b1afaedaeb9a64e8622c8738603e899a981ae5b85f1bf1d362de7f25e6177cd3d60ae7f4320335700edffe5b68c7d9ebe9f6d3176d8ffb097f7054bd407d062255b73f32237189bc9ea5dccdc6341e3dd064b272b0c4321af14cf92d45c215415ab67fca6ddf3bfb83eacad34a628842c78ddceeee222dd19159c8b3079b924e9bb4e8bdf7b9a7d5a2a80ae8abb18f1a3b369970e5fbfb7bfbc54eeea8fc75d2a57463c4b62655e8ee8a936a312013400000000006a992bbb7c3ed49e6873443a21eebf87267ae7f68628cd005ae6b3c236d5f1f8f468f7aba7bd9d376f9eff79bfd609719b0e9686c46bbec1cf480b5c82a329e36a9ad3c9eb1e81bda5b7f56ef91407c547374e875ede73a63226c55237d152c63a1bf516d555c35000fdb0b6d284bdcf5a519778ea4c9ba9b90268afe5b63e2bede734ec80d58e9ab577d507d08f9a6b14fe02c0489e5636b91e8186ea9e1b6a25e6aeb079b9e1f255a9b942a83ad7d513cf8c31956134e51e0bd27d8d6157d12d952b26dc3813a6b9621609a09fb4d5a9f9ce266df1d0fa97046659993b1189667c65a884001a0000000000b5cc955d56c55ff4fdcc5e3ae14e78c29cc6f066b25ff3ed8592b06f77d6a7656ae62caf27fa3a6e14c46f3ee4bdfc6feff1137f4c76f0a84db96cfcc6e1050ea03f969b6811eafff5bd5e7a03e8e70fdbc571434da236ee2ff23bdf9e7fa3bfbcb425e77aeeb1208592208d19d926445de60aa04da39924aa0ca0876aee1a5f8f6256a521f17a0b5698d69b5c5d5a21545d0061dfedd62a7ba2f79e7a2db78dfef940c63ecf1b67c2c480c51378d5cd4fb9ae85548045ee70e103e887b59562cc6a16e74e44a2eeca68f5e9b3d25e1cc972f51103905646fc1cb14169cfb55819f1649af71714013400000000006a992bbbbcbce78cf469f09aed7d77667fbd98e4e5a3cefef2d2db81b1511b9ce5febd96d9c4feeada5558f84adf7ba59eb4d5dd3d9f1cbdd1452b86f65fe590e2e051167661a8ba62d60a0904d08b2780ae8abfa8bcb734f0ebedf1bf1dce3b1952169650e4773e639f67d4bf5d66ad7dac1b40bf99ec174f9aa1f32f3b9febaf28d37ce4fe78dcd55958f8ae5083be97c5bdabaadcd130d7c99a3d80f65c661bf9d3be44bbdfc599e207e5a21c0936eef2b6d39ae4cba289c4d0f93e2bede3371f964f13b20ef93e1b6c13ab947f2a54e116f8adda7ac1dafdfa89e03b118925c171626dc3d7ef5578e79ea1821526249b6241c47d949acf1a407b2d7fb77a49f647c5021abad1daacacc3bedf235632698b87f273e8fd0ffbded2db7abe8619d95e2becc412c5ffef48c1b988b6bcfc47cd35cf1eb44aafd1134fe98be18ed196da8ae86483e54dacac2fed3e237758199b2adf2085ba22511bf76bde4a415c42eec4f8007ad6bb7fee7d89e7b8cd6e570e78e77a048a2fec05eb23e2019037ad8b1fc4374b7765c485a4951177a43820a6abe8965819f1cb5cfa57236265c4cf238df7c4b00d6ebdb7b2bee91569de5f5004d00000000000a86596ec727ab43be0abadd2a719ce678da989f17ca8bd39ebda758fc0a06f1cb5f63e47fcb057f91d833353030feb2ac580350b43cb42ffb533dbcdb7e94af68be10e433d10402f9200fa8fc75d17779c5448b2a4d7cd3d1b6c939bbc99ec178f479ad329e5d85a37807edad564289e0b5eb753ebdd7ab2faf4aca0353bf4669772a907e3993780162b90f37bc0c3da4a2937173fe49f0e55282e11b1c179a2f7beee558c5f43495f598942d0290650199baa792171cb4413e5ca27b9c782740b71289caf7939d173aae30921ecbbddfe5f6e937f7b2807d0be9f3b641df2158bf67aa24f2c60777191c2ee7899b8564f49b1786ea5e730d1ee77852856ae46adf51c8a67beea429af841f96911cf9ea1bb299e49bd4d14a6acf70133a6a156003d5051a6bc50e2a115bfdb27fb5be426e257717f79a9e847da352fbe6e7a5f18281e922b07bcc5ca68d68ad1ebeef914433558c49339d76fa53202680000000000d4324b7659979a217fda74c560cc313335f07ca8bdeb566196ab97fc9a415dbe9fd98b0e8da96ff0f251a738336ed341b9fa8726af6536694e27ebd3321f35558beb6a764800bd4802e8f6fc1bc16b9d0c2559a1dfee5688a2caa392143268ddf0b439eb9ade33bd96db8a61280cd25089830c17cf996773abc261de00bad03b6a66ea6fa1edf4584f91df7943e707ac76d41b281bbf8692dc6341869a047ebd5d219757886bc5b506fedcb93cebc0249ecb6c6f9c099bf8fbdf1c3ca82a979f19e5003aef44885641f6276d75ca7fab11fdf381e9bfffb38ca75d4df1ff3b62e87cad173fced5b3c1b62b07bc0d75deafb35cca53365700ad70f7c5eaddf454da80fcc7e3aeaa0b69979dcf4debfbd72d735a19851a20a32db56a3ad742000d00000000805aeab3cbd7137da98ec7e54f3537be699a1eedae8c4989f9e580a1e839749d936606dd722d572b5c33e4e548675f59895c034457d0378ee2bae93b4fdd0e8c15831faaae48733a49006df1610b37bd220d2592fe5f6deb292956683b35d09ae9e2657c786a28383354ab57d69a9ba7b761ccaf071576d9eb65c6003af0ebed5aaf71930cd5dc35d4c46fd5d6877595ba4d8c5f4389421ddefc53a17a5fb329e92f2f35b479d66b85ddddf3daafdf34749573efd3e7e28018856bbd550c5583d7edd4cdbb85041b7785d5abba90a6db440cc35093b49da7d47c3b66a606148ac6345fcd99d394cd15402b24bfe271d5fb4c6a4d4af31f3498bc32495b3c0c0d43ef9d3519013400000000006aa9cf2e9fb4d5c9d971ecafaeba6d5f8e74de8d4e0e59bb43371af659617b69f7e97b17d2c6daeb9f0fb56b06d97e5f6ca98c49d1fd57f90a4427d589e9a213b91e88312c7e0b16c34db49434a75306c33ba753b3defd818a3223c3d367836df1bf1dd67be6f95f5c479aaac73a1b0de92828085eb7536f88a9b79280023306d019fb3cf55ee2d5588f426e2bbfa04f93916b2879dad564e8fca0353bfacb4b955720ff74a8f133529848dc66b759d37f855035eb90afdecdf50a2ff413cf89dedbdd7c35476190b33e12335303624907ef558887b9abe896780c2495b1a962fc0a0f407964d29ca66c96007ab2bfc5d0697eabb6eaadec6c32f1f5172bf3a0aa5cac8cf80e6aad8c421198b6bc7c330e83001a0000000000b5d46797adb979d2fb00bd96d9e87632545d71cddddfeff32d9a996fe0ea6d893647ee8427f496144ff6b7c83b9d07abca3533e8d07fedac8c4931a61687a6f19ea6aea25ba521f1290e1e61dfee54a8f541006d710abb29c51d9cb5f9f4936ebf555b8d094f876aee1a7aa59befe70e31ff3918f3ab41913fedd35b99c1d0866205660ba0adac8b03620c5d45aab4ab97fa00ba3dff86a1f3531d4f182aa52dbb9f9d6b7c5c6be84ce1a667e4acf54f1442d5b2b004bdbf5814761c8bd9e9fd1b919e9262e36724130bd579f3a6b85ceaf613b19b0e456c7016ab1dfaedae80d58e12e56220e7743626cf3a65b304d05db70a0d9d269ed559ab5acf4aacb05819f1ff1471d1946dc7dfadcc8fef562678dd4ee3574679a67345000d00000000805aeab3cbf45da7e4bcb8ebef3be09ab3ae05afd9ee69f5b72dcf855e114335770dd5007d3ed47ee13737cdf38dafc5a1e5cd44df587b7d777151c1b9f004eb2304d08b30805678639e725d6699a177186a85a7bda5b7c3be37b865d24456d67d774ae7345f7305d07eabb6d6a55d31741585d7fda90fa02ba2930d9d5fe4777ed64deb0f6b2bf56e273ff7aee4f72e230726dccfce9d75b51542554385aa159ae4fc1ea0b7895852434df406d0af27faaae22f8ab5f59a2d4855669100ba3efd8aa1d36e7a45be1eef9dd3d741cb1f8fbb4a82e38d7915a43202680000000000161795d9e5cb914e798b71cad663d3a3ddd2f13793fd855e119abb8f83be712cf28d1a6baf9f7548cf87da339ccfaaa9c5a1d7aba7bd4f3b1b062acafaca4aa801bd4802688514496f54aacb50cd04adf0b431233b60b5a3ca60cbe441cacc15408bb928a46cf31a40177a47193adf984deba2438584d1c88189e90fdeab98f55a26a4b10a4d723d02f5369953003dd9dfa2f026c639b14800adf2ee2b102b13fdf301b3ac0c013400000000008b8bcaecb2bbb8483e5ee815211d7c31dc511993e2fb99bd74dc6b994ddc7f0f751516be7cd469e4a8c67b9a521d8fcbf9f59fb538d466d0b21c777f02688b0ffbad6200adfc064259f6613fbdcdb5c2d3e6ab39815f6f579f6d69f25c66db3fc7d79d2ded00fa7660ecac057386ebabc2bedbadb7b9d7725b3503d3b5d802e8d7137d57ddf43fae7a57c3ffcb6dbe9f3b183ac12201b4c21b178db9fb863ced6a9ad3cabc2bc4f10f83ff7882001a00f0ffb377df6f519df9ffc7ff13a39f64cd269b6cb2a66cb2d9cdc66fb22a96d88d1a3546131313a382a008828034e94d7aef9da14aef0c2388807435a0f88f7c6fb8f56432e530301c18f0795d8fcb4b87fbdce72e67f2c38b3bef03000000c7624f76393b6928f30d553e6f4a4a793e7ff6b9c23fdc6df31f459f4377feb8d877b509c3cd3526ef249cafc5b1c480c30401b48304d02aa7926d4c916e7d7ed2968cb2bb30df5aeeb96457fffaf5409d6e51f35d070174454084b5f6a9e7dc17fc2593a1acd85add158ff70fda3330738e164077e5e7396fdc61adb1cb26a7dbdbcf269db99a71e1861846995f585d7482ca4b11572580ae8db863cfee5b531512adb2326e6fee115f04b13299bf79c995117351797f29013400000000008ec59eec72d2d0a2d4caf0fdd7b1c186aae7f35182fbdb5f2b8d93cfb84de89b9636b6b1ee06e35a1cae6fecac8bbab32cb326807690005ae52584e9bf782e78f9784f938d19a5ca4b084377feb88c87ebd5ad83005ae52584015bbf1b6e59e0574d2af9b5b8dc9e819973a800faf7a14e6bfb72f9b51dc1dbce58fc2d9d18a7b5ce572580b673f72d9ae86d56599998c3bf8906e657a99cc427800600000000c0b1d8935d0e3654f97e72547e9870d2e5517f9bf8f0c63f0e2a2da30efca254855e1ad1a7cfcb5bc873d08f07daed9f3501b48304d071c72e5b4b91fcbf38f5e87e9bfae575d1093666944f063b82b79db5d8d2e7d36316132e2dac83007aaaafd55a7be78d3bd4df0df8745c1f7bf492b5cbc5c360cfc0cc395400fdb0b5d6dadb17c513d85f5d6eb173470ba0d5775fe5c5982adab3b2545666bcbbd1e25504d00000000000ac194bc82eafbfb3d7fbc3c382e7fb075c366e971f5e7b6b8ff8c4387d163cdfdb2f5bda43f46cdca7c7df97a14fe30a21f6f7b6ead66e005de41964ed7fbdbfbc617baeab9fcab5fae24295d7d9996794a9e7dcad056775d12bb41aeb20807eae7a6e3dc4e987918e7a6b032bf30bbbfad7af2d5e78e5f59d150111760eccfce95a6c46a95d00dd575966adf648c277aed6a6b08c01747568ccd2d6cae4462abb2f7eb4e0ef7244035d7094713125f1cf25ac0c013400000000006bc612b24b38ac351740f75596ddfce4a8b5204928f408348fb466277b3b7272fc3efb56e542f38cb2353de3f286ed161bbbbeb16bb0b15abdc2f8b3895ed161da798f7bbad225cf777d04d005ee012a157bc5dda7eeb5cc4efd6931a747bac5805d363959bbcaffbfa7869b6bec1c9809870aa0559a259e76b3d8b358c3daa8786b57590ca0758191d6da279db9aaf2bf8fd81e40abefbecfa7c7c4d63c1dd79bdf427c91abc3623dde3f28b66fcce85cb3caad555626f382d76237776908a00100000000b0d712b24b38ac3517403f9be84d3879c55a907469fe7872e097a74b7d426585dcdf873adbb3b212be73b576905625a31ceda8f7faf088b5f6be9f7ddb9c92666d9c13bdcda9e7dc3dff71e8d27caddb2597ec581f01f4409dcef75fc75516dfff8b53657e610fe68bc24f8f74cb2db376ca55cabde26bfe0b80c50ecc844305d07d5565ae6fecb2b65c160b408f7537aabc6acf6200ad7262daf52fbbf3aefacb4777bcbbb136e2ce6867832d1337b9d182bb7ffdef0792be77139b2e4be8883f3b7373327ebde1f3e931f91b08e74d4e3d46cf615548b4caca58acc32356c6d7faef9f08a00100000000702c4bc82e439d7e48397b754d33ae2bbdea83b1dfda0da085cebcdc6b6fef55c9b396c63ca39c9d34147a04aa5ce2bc7187dfbf4fe4bafad546c5d7c72509bac0c8b4f31e815f9e36094f23f7ff3233d2bd84c9ae8f005a28b919b28c9b2596dde28d963030630e15408fb4d5ddd872c8da8367feaabdeec27c95a7e59295005a5c65fbb21b3f0cb607d0cbb2fbe276c6ff055059998c0b374c0e6e8b39fa7c6af985a2ea9bbb3404d00000000000d86b09d9657568cc93071d6b5ae2775794e9acfa60ecb7a603e8c703ed99bf59fdbfe997cc6246f9e87e5bc0d6ef2e6d50bd76c336b737f75c7b7bafe0f27f960fed5e7e6d872e386a092fd85c3701f4c3b6ba98c3bf2dcb4eb96c721273b158b461090333e65001b4785ac2f658dd7de78d3b6e6f3f9b7fcdbf36e24e554874d6a59b5e1f1c168f99caba590ca0473b1b6c5ff9cebc5c5b266e7e23b1fbd1872ed8b3e9d1877f9b7ef8e2eb3375af2574e78f2a8f47c4def3851e816265c4972ef5a7eb6265d43b27800600000000c0b1ace9ec72c98c4f0daffa60ecb7d63771acbb71d90f415bcb28dbb3b2bc3fb25a88c3761eef1fec2ecc5fec4cd74d002d881fb9ff6d9f9dcb7879c3f6c4d36ecf267a2dde626903533854002ddc8d4db4ffc153580ca005f5d3c1c68cdfbdb9a8005ab85f53e1f6e69e250f5eeca0a1acd896bb2f01013400000000008e65ad67974b4300ed689bd89c92a652a0d91af7bfed4b3bef612de1b296517617e68b9fda93705d7e6dae32c0545feb62a7b99e02e8e7f3e5806d8f3bcdb96c72cafccd6bda7a3193250f4c72b4005a58dcc1e1f9c3f8d67e6a2d80be1b93e06cfd658fc66aa3e26d99b8b51b89efeccd7faabd41547debcbfcc294aec6ba1b17bb322abfb222800600000000c0b1ac83ec720908a01d6d1367270ddd85f991fb7f512f3ba070deb82374e78f5df9791501118bcd2867277b1f3454c51dbfecba79f76283b32bafef0cdbfd537372da2b5e035a71bfb622f59cfb628f428bedf3fdd7f1bbb189622f543ab76760cf1d32801eed6c88d877de9680d8659353ecd14b5521d1d61a58cb857f1fea14cff6e50ddb17bc857104bc84005a7c67fbabcb134fbb2df628b4985acc3717efe94affe86aca205626e8abef6d5c99a433574b7d4317bbb94b43000d0000000080bdd64176b90404d08eb98963dd8d69e73d16ccb35c3639896632825c42002d3d19ecd005472dea006fc0d6ef8a3c834c5e16b728eb2f80166646bac560c2bffed9c6651483cfba7473a04eb760cf760ecc01036861bca729f5a7eb26afb534e1bc71875822f1753094155b6b632d1716e67ebf72ecf2821b517233c49689abdce8f97cde2dbe4773a5d56ddb7d8ff70f8a7b4ddd6bb130ecbb95f1275cd457467cf7c5ca3c1dd73726a62c76739786001a00000000007bad9bec725108a01d79131fdd6fcbbfe61fbcedec8d2d875cffb25bbe33d0e5ff765efffb01bf7f9fc8fccd6bb4b34169dc9c9c16b6fb277309dfb98eb4dfb5e5768d8929b1472ff97ef6ade87fee762f632cf1f76b6fefbdf9c9d1a0ff9d99cbbb1baad48febda22fbb28fc5d10a5df979b6b78f39fc9bc5f69218adb5bb588c7dad35b67d0da5fb351539ce3e415f7deff5c161b174ce1b77282b29d656acb058e7bbb189bf0f75dad8a19d0313f75ad46aab5f627c5ed89858526b97888db036b687adb59917bdfdbf38e5f98f43f2a913cb25164d3ce1a9e7ae8b9594cd267a9bad755e1d16ab3efdbae8f8d09d3f8a2f91f21b1d974d4ee2165e1f1eb9f5f9c93bc79d8d174165e20bde4812bda5fc70cdefcfdfa3cbafed50ee287eda969169f16d93262b9378da55ac83d2cf95d7775e7f77bfc9775f345bece62e0d01340000000000f65a67d9a58d08a01d7f137f1fea1c69abebaf2ed79714e98b0befe94a879b6b965076d94653f75a44ff73b72b2e94c4df1fdcad1cef69b23d30c5ec9461fa61d74847bd583a4359b1b292737b77afc5dacb065f4db39386c703ed0fe5435e5c28964b2c9a78c2edff3d87627aa45b7c89eed756c88d105f22718bd18efa47fd6ddacca8578cdff87bd43b3fa9c5de51ac8c713f7d9565838dd5da7df7d51140030000000060afb59b5d8e75d6279c74f1fef0b08994b357c77b1ad5af258076904d04004746000d0000000080bdd66e76591512edfac64e65548a2b9b76b4a667a85f4b00ed209b08008e8c001a00000000007badddecb2c03dc03c7d96aa42a2d5af258076904d04004746000d0000000080bdd66e76a984c857dfdc9d75d14b8c5f19619167908dd712400300ac21800600000000c05e6b37bbbc73fcb21c8ff78787473beac73aeb6d9ccb73026887d94400706404d00000000000d86bed669761bbcfc9f1f87e7a6ca2b7f9c9830e65842967afaa5f4b00ed209b08008e8c001a00000000007badddec3270eb29391ef197270f3a8ce71273f882fab504d00eb28900e0c808a00100000000b0d7dacd2ebd3f3c2cc713b2fdccd3b11ef189cf3fbf919f84ef3ea77e2d01b4836c2200383202680000000000ecb576b34bb7cdbb4ce2e6802f4eca4f82be3c3d696851b99600da413611001c1901340000000000f65aa3d9e5ec64af329e84932ef243e5b58401ff3d39d256a7723901b4236c2200383802680000000000ecb546b3cbe1965af3912bb1f2cd8fbf319415ab5c4e00ed089b08000e8e001a00000000007badd1ec72a04ea78ca72a245a7ea80b8a949f786d39d89997ab723901b4236c2200383802680000000000ecb546b3cb96d474653c8d09c9f2c3da8838f989fbdb5f37c427a95cbe2c01f4a3feb6b1ee86b1ce7a61d2d03233dab3a8cb45fb89de6679b9e8e7f140fbabb68900e0e008a00100000000b0d71acd2e8dc7a354dbe8cacf939fb86dde55131eab72b93d01f4f470575b4646a94f48c2499788bd3f87ed3e27c41dbd2816b0393975a2b779c11e46daea1ae21245fb98c317e4e5a29fa4d3ae15fee1fae242d1ff2bb28900e0e008a00100000000b0d71acd2ec56895f10c3555cb0f7bcb8a9c5fdb2e3f2cf20c52b97c0901f4b389de813a5dea3977b7cdbb946b2d8a3df25b7b66d6f443d31cf9517f5b634272f057a7d52f17fdeb8222879a6bc41dd7f72602808323800600000000c05e9a66978f07dacb7c43bb0bf26c1fcff470576570644b6aba7a33e300fae9b85e7e3850a7bbf6d73df2c3fc6bfe2a972f36801e6aaa1697b8bffdb57a76ac707d6367e8ce1ffbabca6627e74264f167477676e0d6534a3ebea01bef1f1077b4b12e070134006881001a00000000007b69945d4e1a5ab22e7a5d7d73b7682ffeecd3952e78c9f47057b157b0d79683f22e755177541a87ef3ef722ea7ddd49f970a8a9dae3dd7df2f394b357552eb73d801613493fef71fd9dbde619f1adff7c1b7df057d155dcd18b815b4f999f8c76d9b83deed825b15cb7b77defbc619bf949e790ed67124eba881e22f6feecfbc951f35b5c7f779f5893058b72104003801608a00100000000b0d7b267978ffadb2a83233ddfdb6f1ca4ea8222552e997ed8d55d98eff3cf6f8c2f51a9a1f16ca237d4e907d9ccfbc3c3cae7639df5de1f1d919fc71dbba472471b03e89ec27c9389b8beb1d3fff313e5b7c226f44d268d9f8eeb1b1392a3f69f57afd1e1fef6d7778e5feec8ce560e6e2b869aaaf3aff98bfe4dd2eac0ada7ee5594ace42602009e1340030000000060bfe5cd2e47daea02b79ebaf27f4e26a9ab4a002d2e493c75459e95b631807ef2a043dc4536f3fde4a8f2f9d4bd16bfcf8ecbcfc3769f53998e8d01f4f597e7a95f84dd1f1d69494d7fd4dfa672c9d371bdbeb830f6c86f16d36771dffeea7295e2ceb39306d17f857fb8d79643c617c67ef3db8a6d22004022800600000000c05ecb955d0e37d764fcea79edad3d1683578b01f4a4a1a5c03dc0da252a01b4b8d062d06c1c4cdffacfb72ad3b1318056da786d3958e61bba60290cc5b389b9a2cfca208588af7fb2a50e8962acbba1c4fbf6954d3be4e5e1aa793a0134006881001a00000000007bd99f5d3eea6b159f047c71d2f8e0f3d5377787ec38ebfaba93c5007a66a4bb2d232364fb19e34b44e3e0af4e2b79b44a006d5c6a23e6f005e5f3a7e37a71d39791f12195e92c36808e3fe13c33dab3d8b5cd75f1517a68cbc85cece5e28ebe9f1e23800680d542000d0000000080bdecc92e67270dc3cd35f1279c95a0f9c5e9e37f7fab0b8aecaf2a53d264e300dae2c167f1cf12efdbdd85f9de1f1e5e30801637554a339bbc6c507939a1dbe65d2ad3596c00adfe4a436bc414941ef4c5854be821e08b9304d000b05a08a00100000000b0d792b3cb477dad39ce3e4a8d08e5e0739167d0e38176d160a04e6712408bcf1be2934cd26ad126f59cfb587783bcc49600dab8e7ac8b5ec63f4a3ee3a6f43c3b69b5d43201340134002c88001a00000000007b2d21bb2cb979bb3622eed67fbe75d9b85df9d0e3dd7d69e7dc7b4b8b66270df212e398b8f84690b824d4e907e3f4d9fdedafef1cbfd4a72b9d1ee9562eb12580be5751f222f8def0bf62af60e31fe5b9fa2afd0fb7d45aeb81009a001a001644000d0000000080bd96905d7a7f70c8387a9635379a92524cded1671c408b062697787f74a42eea8e123d2b97d81240eb8b0b651bd737765685441bff48fc53b9457f5599b51e08a009a001604104d00000000000d86b09d9e51f36cc1d7c2ebf1536f3e71c59320ea08db9bffd75f2d9ab2669b572891240a7fc704d5f5c6851a147a0d255435ca2710f8d09c9ca8df2ddfcacf51075e01702e8d57df000c0f111400300000000602f7b02e884932e03753a6b97580ca003b79eead3953e1bd75bbb4409a06de1b5e550577e9e710ffd5565b65f4e000d005041000d0000000080bd96905d3a6fd876eb3fdfb667663db592234b0fea2bdddffe5ab92ae8cbef1ae21267467b542e596c00edf3c9d13e5da9710f236d7504d0b66c2201f4ba3736d851a12b16a655bfa7c0b2686aac120fdb837b2dab3e92e545000d0000000080bd96905d269fbdfaa0be72c19e1ff5b5461ffcd565e376cff7f6675df41a6aaab676f05931696849397bd5f9b5edb604c75736ed4838e9fca8bfcdb887a7e3fadbdbbe7791af282480b6be8904d0eb5e6e41ae5770785e61ded3c9de551f0cd6b77b3d8dbea151e171f123036d5adf6b8511400300000000602f4db3cb91b6ba32dfd0b68c8c6713b64660639df5a53e21459e410baaf00f7fd85a6bdec3409daedc2f4cfddac0ada708a097f741824319ee6ff509898c4d4a7ef4d042b1756019fd3ed693909a2a9eb7867aab1599d62e02680000000000ecf56a66972967af1240affa2e40238f1e7645dc49088b8b7f3c6ae1eda0c0f22a2b2fba1114d6d458b52ecfda1340030000000060af5733bb248076c04d9c99e81d1becb8dfdb74afa7f1bea17962a87376ca607fb7a293a9875d437dad7dfa46d1f3605f8be8795d26657face4b8bebfb769b8bf75d547b25c1e8f763fbcdf269f8d0143f3c840fbef636af57c8cdb3fb8d732faa07d7defb82d9e4d1926873bc51741ac8920fe22feb92c5fb1c1f93ed76ba97102680000000000ecb53eb2cbc5228076b44d9c18eaacac2c894d4af60989f40c0cf30b8b4a4c4b6b69aa7a66149035cfbfe5cc1a7d57bd79b74f467beaefea5232336e47c77905878b9e83a262135253cbca8b86fa5a8dd33793dec460da5a6aeef73699f7a9320641743bfef2ed7feacc57407e2efe626d954c56405759d2d850699efd29035059f0e1fe56d1a0aeb65ce5760b4ebcb6b6bca7f3eed86087b54bd49742dc7dc19bce4cf48a0966e46485df4990cfc6adb0a8a884c4bcc23c7d67fd33b3fc54b4ef6aaf336eef1f111d9d9824767cb0cff2fbf1e4aad6d494a91f1897cdc49fcfe74b1e2fb8bfb2a5edbb66ae6ffe2e62957e1fb3faee56d9e7b8f52d50be0855d5a589e969e28b20d644107f11ff14df8e27565e0cbbd86f849891b5bb7775dc150dc4d75965220e8b001a00000000007bad83ec720908a01d6a131f8f7687c4dcf10c0cf30a0a0f8e8abd1d1d772b2cea46d05c4c969e9d393ef4225cbb939222b3338b8a4b0b8cfb7c3ad9dbd652131cf5226ebb19121934dfb36fe88b9ebd82c38b4a0a9410d05ab73149c97dfa46e3a85a650c424b53d5bd9e46f53692c922e82a4be4e7959525e6b9aafa0a8869eabbea95412a03b0b6e0cf260d2999197211c4ed6cdc2695b9a465658a9b9a0f5b7d29c476a8df71f87e9b1ca71c6a40448cb844fc299e13e5be0fefb719b78f8c4f903ff20e8e088c9c7f96c2a3e58e0b65e545536645b19555cd29c8b5b6f24a33f1e7f3f9c875c1fd952dd577ada9b1cada19e499717d625a9a9cb8c55fae186f8a4af86bf245f00989146b22c8745e0e4334303f21bed86f84b55f78888988afb3bcb5a1bbc1c687cd711040030000000060afb59e5d2e0d01b4e36ce2f4b8beb8b4c033302c2022a6a15e373ed83131d439dcdf5a525a782328dc3734aaf765fa26833cd12cb730d75c4b73b571b73535657e2f63af82a2fc0143f3d87ccf837d2d77eb2a64de2d3cb8f7e254acfc67625a9ab850a8d0158bbfdf980f3ac362e38d8333d9322a21d1e230fa7a1a4706da8d3f49ce48979798b4345987e88424d92c2e39c5da8156b902ca20abaa4ab3f373e4c96eb150ca20170ca0471fb40746c628b7b371a7647b311d650aa999194a8e29fe52555d6a72aa571989f1550ab1c52ab7139ba51cd7cdc8c9eae9ac170b2b3e147f76b5d729ab2ad6c1627b7d67bd98a67c965a9aaae48edf080a4bcfc93239e9ac04c462bb3bdbeaac8dc73880eeeab86b3c11f130983f99cac0e485626ce6bb763324b2a9a1d2e2ed7a3aef2a7b94999badbe292a01b4f24510c32baf28160fbc581341fc45fc53f91f0e94d19af46cfb37c25a002d26a284d7e28eb6ff97c1411040030000000060af359d5d2e1901b4e36ce2707fab0c071beaff94c4cd4e19da5b6bc587cad94ce30450ddc840bbf7ed08d158f46cb114f2cc446f5555695a56a6f28979882606d0a76f92e15d627a9a4a4b750bc6c1c2fdde2699e1ca40b0e965f5061372054c6e3d7cbf2d2e39450e7272b8d3963b8ab9cb4452de4ea58686318b59e7f4b85edf591f9d90244f19e715e61967d0ca485412528b1e8f76c724257bce17dca8aa2e356ff06ccad0d379574c7964a0cdb8bd9854475bad79fbdfc77aca2be68e2d7b0585e7e4e798afaa1414156bedb8b1cae3270f445b7b322d5ea8ec9a7844e5ae99c8c8c992d39103b3b647eacb2b9e2bf945884a48b4586b457c3b647a2e9a9994d758ae6f849c88fc8e47dc49b0f161731c04d00000000000d8cbd1b2cbc703edfae2c2becad2a75abed28a00da7102e83e7da33c0d6a1efccd4e198cd34c1b03e8dfc75e1ca90e8b8defe9bc6badd9dc3b0f1ffc9185590bd13273b3650eb8604b6b6c2988919d9f231a883f135253c55fd2b233672c3dff160368a1b1a1520e521ee856bfa3e859a6815555a5b2c3dada7231860527a292750ef7b78a31cfe5c5e1d1c6bf48587200ddd458e51d1ce17d3b424c56a556f2e88376b18fc6eddb5a6aac16b598e84dc9ccf09a3f566f9cf9ca4590f53ac45f92d2d32c9e405fde005ad9359f9048e518bef11e89dd14e3147b24fe54d92395e5155f84c4f4b9221ee171f12aeb2f7e241ac84cd9f8d58ecbf28d7832d62327d2d15a7b73fef72bb53614fe762804d00000000000d8cba1b2cb477dad69e7dcc52d5cdfd8d9929aaeddac09a01d2780bedfdb24cfe136d4ebd45bda1840dfeb69941d2e2aeab216a229d57e176ca9321ef5005a2988313ed8d1d95e371f86c6588ccead05d02639affa1d9592088f46baababcbc45fa21392c4186c5c226b51e6f4b83efcce5cfde5e0a8386b03b3d1d3c95e5935382533c3bc64b34afbf4ec4cf596837d2da1b12fc27725a7569e2b7d67bd3c226db1e4c5b207d02a8b23f748ec8bd8a3a29202953d52595e437783fcd54efddd05be59e29be2395f6cda96c21a8bfa46c89ec5e067c6f549e9e9f2efb63f098e80001a00000000007bad627639ded358e27d5b78d8fae27f991fa8d3797f7858dea5c8334869d95d989fefe6d79890bc5cc7a2ed09a0a787bbda32324a7d42124eba44ecfd396cf73921eee845b180cdc9a913bdcd4a4b6b01f470734d435ca2681f73f882bc5cf49374dab5c23f5ccc54f4afb47c1502e8c9e14e794e3324e64e5b4b8d4a4b1b03e8aaea52f93ffbcbe20c36b216a2c90202c6afcb5bf6005a16c4506a1a84cd1f4715f7b5b602e6b76ea8af94831cea6b55bfe3e3d16e39a382a2fce7f38520e4ed4cea9fa82c914a942c3a91c775875fbe18706901f47d43b3bc4aa522f392db1716e77b1a952b79fee7e7aaa4acf0e6fc6f2faaabcb4c4e522f7b002d77cd2f2c4aee9af91ec9da2362316f85475bdb2395e5155b6ce31741348898ffe5817c2a8c7bb6e71b2126227f27218ba2b4b7d6ca8998d4fa707004d00000000000d86b15b3cbac8b5e2e9b765cd9b423fdbc874c5defe94abcb61c9277c977f39b19ed111f1aca8a03b79e129f78fc7d7f9fce4235d825584200fd6ca277a04e57ec151cbee727cff7f63bbfb65df9a9e2fabbfb82befc2ed7c5a72b3f6ffa61974900fda8bfad353d23ed9cbbffe727dcdffedafc72b114de1f1c12fdd745dd196eae11777c1502e867f3b59ee551cd5be1d1d9f9393d9df58f47bbcd0b29c8202f323ee15e4fa339a5596e41ae68969597fd64fef9b191498826ee3e39dcd5dc58e5171665722456b614e3541f86423d809e1ed70747cd557ea87b795ebba8a440dc312022e6c998e9f84d02e8d947f7c41cbb3aeeca32be62908f46bad5ef68e86e108bec131229872aee2e0fd85a2bfa61be442a51f2505f6b68ec5c9cadfc224119496d6db9f95a597bd7626b73b5a76ae1637bda373556c9df760cbd2c0e6e1c108b4d4f9faf251218196332d3e50aa04d762d3a3149ee9ac91e8907a04fdf24f7e84eca8bc22ce65538543645f46ce317413410cde4604c7ab6fd1b611e40eb3beb6f86448a89c8222a8f1e76c9b2d7e2bb634bc9170741000d0000000080bd5631bb54d2558f77f7e982226bc263e34f38bb6dde253f0cdc7a2ad7c5a7213e29e1a48bf3866df2c386b8c465b9f56203e8a803bf8811fa7c72d43c35b6e8fa3b7bc57a1adf455c9e74daf5caa61d36f610f4e5697189df67c7d77d00fd7c3e83cecacb96274f6529808c9cacaef6ba67968ea05aa33493e7a9cbca8bacd502b64876226e51a12b16c4e5c919e9b29447686cfc7d43b349cb0587a1500fa065d9076164a05df9243032567cd26cf62a4225ca94832caf2816eb26df5327164d19a4ca1d4bca0ac5e7e177121e8f761b0f20382a6ec143ca0b06d0d3e37af92640e5b581ca482cb2768a5c9e61179ed9b6838b6adfdbd5e039ffce3d19ef3e370b88c5e7b218745442a28d25c86d09a0c50a5bd8b5a070f35726ca3d125f01658feed655c81ecc237b954d914faf2d5f04d14034f39c2f486dd2b3eddf08f3dd4ccbcaf4fcf3597e39358b13715804d00000000000d86b15b3cb9ab058978d16ce115be3b5e5d048bbd577ca2dca6203688b3cdedde7fbc9d1c0ada76efdfbdb1bef1fb03d5c363eefecfff909d1c3cd8fbfb9feb7bd2a8dd777002df5e91b53b33264315f2939235dc9e09ebf0cf2bc6f47dc8e8e3367d2ccf6121992793c7a2368ee44b618d2c3fb6de62dfdc2a2d487a15089837f1febc9997ffd606a6686f1e7f2106e647ca2f14be19e5b89e0c54862939287fb5b17bca3b89de8d3d3ac3ab62c8c905b906bcb12a9e7d4268baf8c242022c67cadeaac14e936af32ac6e51edcdab829827cb86ee861b417347f28b4a0a4ca6b6e400dae2ae757598fe076d62a853ee91491170b947e6d59c5536453de55f700d17fb8d30b9919888fcdc78220386663991d6e66a1b3777d51140030000000060af55cc2e270d2dca095f5be4baf8cc2ed3ffb86d67001d7be4b7a6a494a1a6ea097dd393071d537dad0f5b6bf5c585e93f5f574e70abf07c6f7fee155fd17eb4e3eea3fb6da287b1ee86c186aaead09850a7b3af6c002dcc4cf43eb8d7525256282b72c8e393932f8b62cb202f26316962a8d39cd24972c6dcbbce8a4b0b9e4ef6da7e6b79bbc4b4b49a9ab2f8d45479a6b8a9b14a0cc962cba29202f5612854026899c7dd080a3709221b1b2ae57154b11ac69fcb159083cc2dcc55466252c3c1da1dc5ed6e86448a799914f7c8cc9d2bbfe01f116dcb12a904d08f47bb65d907313c9391b4b7d698afd5ef6635462471b9bc6adab69aef8b6a2f965aaead5289d83c599e9d32c802ca62b994f7f2d91940df8e8e53df35a9feae4eee91494514b947e6bfe150d914f9bb1c5bbe08a28168261a8b4b4c7ab6fd1b6112408b89cc2de0ed08e3893c19ed911349b754e2dc311140030000000060af95cc2e270d2d35e1b115fee1639df5cf267a332fdc303935ecfdd19198c31752ce5e15429dce5e7b6b8ff14fafbfb3b72d63eea0686f6951b157707761fe92df49b8b400fafabbfb8a3c83869bd55e94373ddc5515121dfcbfef2de6c8d1077f6d884f9ab15e92552c8be85f0c4f4cf6150ca01563831dd9f347838d4f7ddaf81242f3b7ccd9c238441bec6b0989b9e3395faac23cd35cd4c1d2e73614c4f00d8d126396850ea4dcc25c59eb4034306e6f7cbef8d99441d6bb088a8aedfb73fe68ed8eb22482686f7c2f2139235d26fe77eb2a165c2295005a295ea1e4e94b7b0961675b9dbccab8cec372b5377f47a5c5e7eaf7b19ea4f474b95cb2e5b2d48056d9354926f82a7ba4efacb7715312d3d26cfc22282f02159798f4bcb46fc4e883763911d1de7c229e7325b6634d26e2b008a00100000000b0d74a6697e9e73dfe4854f7fc645c8c22e08b931dd9d9b37f3ea9f764b0a33622cee3dd7d9737fc11c5863a9d95b1b5f8535cb2b491d818402bc799afbdb527e9b4eb8ca5138b163d1dd7eb02223cdfdbff62e41bfe77f3e36f5a52d36d1fe15053b571cde8a803bf38c826ae98a9875da1b17399575a56a6fcc4c600baa15e278fb8eabb169170998468edadb5f293caca129303a4cb15402bc516548806c6a7aa4d0a5c0cdf6f93050d9233d28d0769f18e4a4904f5db593b95fcdc8600bab038ff4650b85750b85238656901f4c8409bb2c8b61c631f1bec90ed759525ea2d67267a65d26afc6a3e6bcf95681c1435578c3b262979fe4d80cbf31242e35d3359ede1fed605f728273fc7f82a95e59507c3c517a1b7ab417d590cdd0df2171ecad1f5e7f67d235a9aaa6c9988ed8fc42a22800600000000c05e2b995dc69f70b6782e38c7f9e6545fabb5abfaabca429d7eb078e192476263007d3726c16df3ae5bfffeb6353d43e5d8b2350fea2b23f79d17b7883b7669b463d1c7fdc41dc500dcdffedaf3bdfdad69192a2dd765003d3b65884bfe53726763003dd4d72a4f6b662f26e13209d166267ae54955ff88e8fe97b51a2cb65c90b5005a165b109f67e666e716e69a90a7954503e3b2bf2601f4b329434969a10c198d8fd35abca32c89e01f1e2d96c5fc7672b2e27603d60f11ab47c92303edbea173351fc4ae998f645101f4eccb63c2c1517183d6ffcb60dede620d6e63edadb54a0de2d93fafaac5e74a495dabaa4ae5915efb0368e35d33a9822d4ffdabef9118ff80d90b002d2eaf583a598563c1a837bf28cf73befe86f16adbf38d9045ccc544720a4c672144c627c889d8fe48ac2202680000000000ecb592d9657b6696efbf8e9984c815fee1d32f8bfc5a33da7137eac02f2617a69cbd3abe9854cb988d01b435b250464b6a7a4d786c91675055487453524a7f75f98213513cea6febd3958a9514d3173d88bf88c59195491c7c1397ddc8405b6e61aef9ffd7afbc312f2befc539771b03e899895e5966c12724b2acbcc85ab3c7a3ddc61527cc43b4c1be16e5a4ea9351d333a7f607d032d08c4a48b478d5b329838cd14533e543f3f72b3e9dec0d8b8b9759ad3248f33b2a25118a4b0b2cdeeebea1392022c6d3e8bcb93995acb3b3ad4e16df1063be67290a5f5400fd7cbe52b33c939b949e6eb1b2b6d4d458257fdad7d328e3efecfc1c6b95a04706dae58966f1a7712163f5e72aaf30ef46d0dcb3242b60d81f401bef9a78c09412e7628f022363d5f7c8bc308bcaf28a47480cde73bec64ba5f5b3e1e24772e94463718949cf4bf846e83bebe5448ccf53ff6922bd4d7222ea255f1c0401340000000000f65ac9ecf2e958cf409d2e72efcf4a5751077ef9dd7abaa4989d34f45795290531dcfeb2abc42b78aaaf75766a89ef245c5a003d33d22d86a10b8a8c3ef8abffe7273cdedd2787e4fac6ceebefecf5fdf458f8ee7305ee01fae2c249438bc51ec6ba1b3af372d3cf7b843afde0f3c9d16b6fed914536c45f3cdf3f10b8f5d49de39745ff0f5b6b1755de7aed06d062078b4a0abc82c20b8af287efb7291bfa74b2b7a3add6373452fc4849a9d45f4268fc4ab7470fbb82a3e6f250bfb0a8f28a62d1b371d180c723ddf77a1a93d2d36e8545296ff9338fdbc425a5e54532bf333ea9eaa9fa1242f312161603e887f7dbbc6f47082a41764d4dd98da030d16664a0dd78054c2e696aac92b1a018a49ca6f91ddb5a6ae4edac15de7d32da238fdffa84444e5af93d8aa7d9eb04471fb47775dc2d2cce0f8c9c0baf032262943198ccdde24b085592e5e971bd188f9c7e625a9ad826e3859d19d70ff5b58a67464c5c6e8df84426c5376f47880b07fb5a94185a3c548f47bbc5005e9c200e8b320946d503e8f1c10e79125f5a9600da78d7c4b0e58a3536548aa75d3cb12a7b149530f72b99d8a464658fac2daf5c2e3178f96b0c31eb867addd8608712318bbf887f565695ca53d2a299686cbeddb67f239496625fe444ac3d486222f2774b624d6c7ccfe42a22800600000000c05e2b9f5da6ff7cfd458ebc7997beb8d0f60b95d4d8f58d9dfd5596cfd62db62b1b03e8d949c3485b5dae8b8ff747472c16033176edad3d778e5f369f5a5b4646c4de9f5d5f775ab087a02fbf2bf30d157774d84d5c2ecfa60c5555a5deb72364ac56575bdea76f122a74c53238bb939232f6321793419e5f5854426aaa399373a3edadb53283be1134f7c6b992b2c2c686ca96a6aa9a9ab2f49c2c79dad72b385c09fb2c9e6b7e3cda2dcfccde8e8e53ceccca96e2138bc310b73099a3791c3c3b6590450fc41c55de9ba7140b2e2a2990d1bcc5007a7a5c2f662487247b33b9a358e4ccdc6c793b95f7d129e5269a1aab2cfe6a47fe342a2151996c744292dc3b993e8b1e66fe7c845f1989f155c6549e0db1f8e29110db27a7965b905b7f57279657eca3583db1a7733b18145efaf290bb6c2f6f27665a5094df50ff62c73372b2e4f965d15e3c2726a1e78227eb1fdc6b91277697318056764d3ccf62d7c41e85cfcf48fd9d81f246e212b147d636c5e43954be0862ee620ca207f12341fc45fc532eaf68209a59dc6edbbf11b2e5d3c91785b3c5445436573eff62222a255f1c0401340000000000f65af9ecf2c6fb07643fa13b7fb4fdb57ec2fd9a8aab6fee96d796fa84d833864505d0a31d77739c6f2aef03b45dec91dfeee94a66467b7a0af303ffdf778bbd5cdcb122205ca53af62a6ee2329a9d3274b4d5ca6398c6bc82c363929295d7d93d7f19e459631eff0df6b52667a4cbe4d1b4f3a0f0e8c42443f71f2f67b318b70977eb2a94f7b3c993aa2a63b0d88379003d3ed8213341a5ba8845e27609a9a9321f94a7532d06d0cf8d6a1aa465654e8feb4dee28fe296f575094af723b71a12cc520ee627218d678898c7907470446c644c6278a55b2789455198935eacf86e8b3bca2d83f22dafcc21b416259629b1bab8c236fb16239f939f2b70be63b1e1a7ba7abe3ae79b66e4b6997dada72dfd0c8650ca0e5ae29654fc4c094f45f6518e2eb20eb862bbdd9f21c3ebcdf969a95a1fcaac098786cc48f44036bdb6dfb3742b6143be2397f445a7d22face7a399145156a5f1504d00000000000d86b65b2cb49434bcad9ab115fff14befb9cd24f817bc0a23a99ea6bbdf5ef6fe5b537fe7150741575e09732dfd025ccdac600fad1fdb68a8070ef0f0e39bfb65d69effaba53c07f4f269f71ab0a89eecccbd517177617e6df8d8e170b787bdbf7d7ffb6d73844f67c6f7fd8ee734af19017837fff8018bc68df9890dc5354207a10fde80222e28e5df2fdd731e323d2e2be62ca0d71898f5f166158c54dd4d4605f8b3ca97a272525312dadb8b4a0b3adeec99fcb590cf6b5deeb69b4c6e2dbea641a2b7b4e484d159d8bbf9457147775dc358eb69fcf47a58279f02a7a1830348b1f0df7b72a052e5498f72066217f64dc679f7ebef190859cd7d8e88376d14c3496f1ae5c01f35b8881c9418a3f454b933b4e0e77c9db3d5ae8f73db2fffbbd4dd6d26413f77b9bc508cdab8e98cfdd9a051f0c31b59181b6fabbbadcc2dcc4f434b183c919e985c5f9cd8d551653f26753869181f686fa4aa57d6a5686789cf49df5530f2d578490b3567fdbe1cccbc7c062333112951eacf52fa6261e2ab96b62cc724154165392c3b8fff23580363e873313bde2c3aaaa52f915935f04f1cffb86e6192b75e717fb8d902de54444b7ea1351d69313d00000000000ac7f2b935d96f9869a9ff05d6c3f4fc7f5213bce9a74e2faba93b582cb2a6c0ca0cd0f3e077d795aa538c6e381f6c684e4b0dde7acd5d9109fc71dbdd8919dfde481a5ec6ca2f77e6d4589f76dcff7f61b5fe5b679972e2062d53711005e3504d00000000000d86b65b2cb02f700fb03e8d9c9ded09d3f9ad7a998d0372d763c3606d07f9c44deb0cd6bcb415d40848def06349415dfdef6bdb8caf82c73cce10b3696757e3cd09e7fcd5fa9552284ef3eb7ea9b0800af1a02680000000000ecb5622538c2f7fce4fac64ee3ecb8e4e6ed4575f278a03de0bf278d7bf0da72a8c47b719d483606d051077e916d124f5d196aaa5ed42d1ef5b5e65ff3bff6d73de272f1676d44dcf4b0e50a00163d1bd70f365485edfad196dd218006002d1040030000000060af95cf2edddffe5af633f712c2d1050a9e1a7b505fa95c5beeb7c0ebcbd4d918403f9be8d51717f65797db78f0d9dc409d4e2c978d079fcd89fbf61415884e9e59a9d3ba5a9b0800af0202680000000000ecb5f2d9e59de3972fbf7c41df83fa4adb2f2cf50991452d5c5f77d21717d833061b03e8b582001a00b440000d0000000080bd5638bb9c19ed310e7f332fdcb0f1c2f19e46e5d57cd7dedad39e9965cfac09a009a001604104d00000000000d86b25b3cbb68c0cef8f8e98bc45b0cc3774c1e2c8c3cd35a14e674d2e8c397c61b4e3eed24642004d000d000b22800600000000c05e2b995d269d7635099185ebefec2df10a9ee86db67695a1ac38e6f005597cc398cbc6edcdc9a94b1b0901340134002c88001a00000000007bad64769979e186ece1caa61d015f9c543a747d6367cce10bfae2429357ed3d79d06172685a5c787bdbf7aeaf3bc9421c9d79b94b1b0901340134002c88001a00000000007bad6476f9745cdf929a9e7ede63a4ad4efc3dfad0afceaf6d373ed4ecfbe9b194b357754191851e8151077e71dbbccbf8a757dfdc5d1d1a23fae9cccb4d3ee3263a59f2ac09a009a001604104d00000000000d86b15b3cbb1ae069f4f8e9a17e5b026d7c5e7d9b87e596e4d004d000d000b22800600000000c05eab985d36c427c9621a36baf9f13763dd0dcb726b0268026800581001340000000000f65ac5ec327ccf4fb2c36b7fdd93fef3f594b35703b79ebab26987fcd0f3bdfd115fff244615ea74f6f286176f1d6c4dcf58965b1340134003c08208a00100000000b0d72a6697778e5f961d269eba323dd22d3ee9af2ef3da72487e98efe627df49d85b5a74f3e36fe41b087b0af397e5d604d004d000b02002680000000000ecb58ad9e5e381f6da88b88eec6c993e0b03753aef0f0fcbbb147906292dc7ba1baa42a23bf3729f5203dac1361100d63102680000000000eca5249219bf7aaa346b494d575ade8d8ed7683093869694b3579d5fdbeeb679576bdaf254dbb0683d05d03323dd04d000a00502680000000000eca5249231872fa834d317172a2dcb7c43b51bcf58677da94f484d78acacbfa191f51440f75795297329700f5069691c40b7a4a6affac801c0c111400300000000602fcff70fc8443274e78fb3935633df49438bf36bdb65cb90ed67c43f577de4f6583701f4d3717dfcb79795b974e6e5aa34aef00f97cd9c376cd39714aefae001c0c11140030000000060afc0ada7642819f0df938f07da555adede7646b6bcf27f4eeaf53a1cdfba09a0db33b3aebeb95b4ec4fdedaf675e56d336277e9475d14bb6f47cffc0fd9a8a551f3c00383802680000000000ec75e7f88bf3b3d7dfd93bd850a5d2b2b7b448c93a65cde8a9bed6551fffd2ac8f00ba2a24facaa61d7216aeaf3be5bbf9a9341eebac0fdb7deec56977a7b3a31d77577dfc00e0e008a00100000000b057996fa8cbc617b535eaa2eea8b49c9dec2df20874deb04d896ebdb61c2af1be3d50a77bb4d692e8b51b40ff3ed439d454dd1097e8fff909650a42fc09e7e9e12e950bf5c5856e9b7729ef2a54392b0d009008a00100000000b0574f5181f78787652e797bdb19f5c63323ddf1279c9562d0d2b5b7f6dcfacfb769e7dc3bb2b3d53350c7b1e602e8d9c9de7bba928c5f3d83bf3aedf1ee3ee3f59f3fd1fc83fae975a1d0235069df9890bcea330200c747000d0000000080bd66467b620e5f50a2c9feeaf205dbd784c77a7f74c4240395dc36ef8a3af04b916750675eae2387d16b22807e36d1dba72bad0c8eba73fcb2d79683d6163cf3c28d270f3ad4bb1a69ab538a7d8b4b1ef5b7adfaec00c0f111400300000000b00c2a83a3942a1cb6a49933a33d7dbad2d473eebe9f1c757dddc93c1575d9b4c36bcbc1b05d3f665df46a494d1f6ca8fa7da873d5a769cc6103e8e991eed18ebbed9959f9d7fca30ffeea2356f88d9de62becfcda76ef0f0ec51cbed09a9661cbda16790629fd88b9affa3401604d2080060000000060190c37d7047c7152a9a7d1919d6dcb55b39386feaab20afff0b8a3173ddf3f60f17caee4fbe9b1f49faf37c4273d6cad5df5c94a0e18404f1a5a9a9252729c6f863a9d557e1f604e6c50d8ee73459e41dd85f933a33db6f43c3ddca59c5877dbbc4b5f5cb8ea9305803581001a0000000080e5d11097a8449cc1fffbfec9e00287a0cdf55795e55fbd25ae757ffb6be317159af0fee050be9b5f4f61fe5877c3ec64ef6acdd74102e8477dadf77425baa0c8802f4e9a54d636afb29d7acebda7a860b12f0f14ed8b3c8394ae924ebb3e1dd7afe29401600d2180060000000060794c8f74471df8e5f286f9021a1bb7a79d735f5a0567d1cf83faca96d4f47c37bf50a7b3de1f1db17898f7caa61d373ffe2672dff9428fc0cebcdce196da152e18bd5a01f4b371fd58677d77617eb95f58c249975bfff9f6ea9bbb2dd430d9b8ddf3fd03415f9ecef8d5b33e3661a04ef7a8af7576cab0d8db3d1dd7eb0222945b88ed18eb6e58c9f902c09a46000d00000000c0b2e9af2ef77c6fbf9281ea8222ed0c85a747baf5c585459e41d1077fbdf6d73dd68ef7babeee14b8f554fa798fe6e4d489dee69599ecca07d062313bf372f35c7dc3769fb358385b598da02fbf2b700f68cfcc9a34b4d879d396d474ef0f0f2bc7a8c59eaecc6401607d2080060000000060393526245fd9b4430943f35c7d97f160727b6656da4fd703b79ebaf6d61e79d4dae2c9e8802f4eea8222fb2a4ba7fa5ab5abd1b13201f4e381f6c186aa86b8c4c8bd3f1b2fac69e8fcc64ebfcf8ec77ef39b58ff477dadcb72eb6713bd1dd9d9ca4d5d366ecf77f3d36ea600b02e11400300000000b0cc729c6fbabeb1530946134eba2c63e7b39386270f3a06ea7475d1f1a14e6755de5be8b679d7ad7f7f1bffede5fad8042d6a166b1d40dfd395a49ff708f8efc9eb7fdbabfe7ac6529f90feaab24943cbf2a6ed1501e1c6a7cec53e4eaed4e97200583708a001000000005866cf267a2bfcc38d8feb067c71b2233b5b8b7b4d1a5ada33b3725d7c42b69f71dbbc4b258c0edb7d2edfcdaf332ff7f140fbb2dc7ad903e8df873a0d65c5a53e2171472fce1df1b63217978ddbfd3f3f9179e1466342f2485b9d16abfaa0be32e1a48b7247e70ddb429dceae70896d00581f08a00100000000587e8f07dab32f792be7a02f6ff89fd7968325deb7c73aeb672717fd1ebc05cd8cf68cb4dfed292a28f30d8d397ce1d6bfbffde3d6469c376c13c3b8bded7b99de0e36543d79d0b1e4f12c4b003d3ddc35dc52db99979bebe213bee7a79b1f7f63b1ce86cbc6edde1f1d09753a3b97a1e7e40c35d74c8f742ffb32ce4e19c4c6d5c725067d795a79f1a3184fec91df06ea742bfc0801c0fa40000d0000000080269e8eeb735d7c4c4ef286ed3e571f9b3033daa3e97d071baa74419189df5db9f18f83ce1bb6593c472c3ef7fde468cad9abd5a131fdd5e54bb8919d01f458677d73726afa798fc0ada754de28e8f1f7fdb1477e2bf20cd217176a113a2b9e4df4f6141588499924e0e2138dce5903c0ab80001a00000000000d0dd4e9ee1cbf6c12aa5e7f676ff219b7a6a49415a8ea30ded3d8929a9e76ceddfff313caa95e73d7feba2772dff912efdbbda54536e6e38b0da095643ceed825ef0f0f5b1b89f3866de2a732191f6aaad67a7dc464bb0bf3735d7cccc3fae0af4e6b543805005e1d04d00000000000686876ca306968a9f00ff7fffc8471be29fe7efd9dbd61bb7ecc73f56d494d1f6eaef97da853bb6188ce879a6b3a7372f2ddfc22f79dbff9f137166b745cd9b4e3e64747c2f7fc54e01ed09a9e31d8503563fdd0b12d01f4b389ded18ebb3d85f9459e41eab541bc3f3814eaf443fa798fe6a4d4813a9d3db54116343dd22d46d55d9057ec151c75e017716be7d7fe14cd7b7f7838fde7eb0f5b6bb51b0300bc2208a00100000000580903753af3f20ec66f294cfff97a437cd2c3d65aad47f2745c6f282bd60544a8bfeb4f0cd5f75fc7729c6f76e5e7593ca9ad1e403f9be87d505f59e27d3bd4e9acb5595f9e7f3b62c8f633b92e3edd85f98ffadbb49efba4a1a52929454c4a655461bbcf75e6e488f1affa330300eb00013400000000002b67acbb21eb372fef8f8eb858cf64bd3f3854ee1766282f1eef69d47a3c4fc7f5fa92c2ec4bde815b4f5d7f779f4a4c5c70cdbfafb2d4b83a87c5005a7438d45c53131e7be3fd03d67abbfae6ee5bfffe36e9b46b4b6aba68aff51c1ff5b50ed4e974419161bb7e3439e96ccc6bcbc184932e86b2e2557f4800603d2180060000000060a58d75d6b7a6a6277e77c55a183a97f9fe6597cf2747e38e5eac8f4d588152d14f1e740c3556d745dd51391a7cedaf7ba20ffeaa9445360fa047daeae28e5dbaf1fe018b6f3e747e6dbbdf67c74b7d42faabcba6fa5ab59e91583431d4b473eeb7fef3adca41efb923cfbb7eac8d8813835f81341c005e3504d00000000000ac9ae991eece9c9c22cfa0b0dde72c1647965c5f770afeea749eab6f675eee0a44b78f07da3bb2b3f3ddfc429dce9a0fc665e3f6802f4e8a91249c74513e349415a79cbd2ac669de3e70eba9f4f31e2da9e92b70a07b7ab8abbb30bfd42724e6f005b7cdbb54d633e8cbef729c6f3625a54c1a5a56fd310080758c001a000000008055f66ca277acb3de505e5ce61b7ae7f8e580ff9eb416467b6d3918b2fd4cda39f786b8c4813adde38176ed463533da33da71b7352d23fde7ebfe9f9f3039162d4672fd9dbdca3f6f7efc8dcbc63faa5b386fd8e6f3cf6fe28e5e6c884f1a6ea9d5f404b7e87ca8b1ba3d332bfb9277f8ee73de1f1cbaf27f167270d7d79dc490a20efc52e27dbb3327e7616badcafb150100cb85001a000000000007323b69783cd0de5f5556ea1312fcd56995c211d7feba27e0bf27d3cf7b74e6e56a3da447fd6d1dd9d9e17b7e52198fc2efb3e335e1b1e3dd8de2424d0776bfa6a2c03d20e8cbd3d7dfdd67b1e887e4f3cf6f72aff8f69616cd0f89570b02c08a22800600000000c0714df436b76564645eb811fcd569e323c626aebfb337fae0af459e41fae2c2692d0ff68afe934ebb5a2cb5218617b6fb9c18ada6e79dfbabcb75011109275d3cfebedf5ae82c46e2fde1e1f4f31ef5b109c3cd35abbe8900f02a23800600000000c0d14d8f743f6cabebccc9c977f38bdc77dee793a316df133817bc7e74443410cd44e3a1e61a2dc2e8a9bed6a6a414df7f1d330ec4c57d0baf078c76dc5df6dbcd8cf68cb4dfed292a28f509893b7ad1f7d36316eb9388c1786d39747bdb995c171f31bc813addf470d7ec94b647b001000b22800600000000602d991ee9eed39596f986c61dbb645c85d93c90f5fffc44e6851b8d09c9236d75cb3e0c318698c317e4bd6efdfb5b7d71e1d371fdf2dee2517f5b7b6656ae8b4fc8f633ea6f148cdc77bec03da02b3fefc9838e55df2000803102680000000000d6b0cebcdcf4f31e01ff3d79fd6f56c36821f8abd3a53e21fd556553f75a96ab34f3d371bda1acb825357db96a6e88813d79d03150a7ab8b8e0f753a6bed4d8c82dbe65dfe9f9f483aedda9890ccbb0401c09111400300000000b0e63d1e681f6ca86a884b8cdcfbb3c5ea1c2f0e0bbfb1d3efb3e371472fb6a4a63f1974acc3c2ed9959693f5d0fdc7aeada5b7b2e6fb09aa4077c71521714d95759faa8bf8d370a0280e323800600000000605d99ea6bedcccbcd73f50ddb7dcee2db0295305a3428f20ceaccc979d4dfb6f2e39c19ede92d2d2af1be1d7be4378fbfef57a9b011b8f554fa798fe6e4d4b1cefa555f5e00c0a210400300000000b06e4d0f77b5a667249f71f3f9e4a8db5fac965116a20efc521b11f7a0be72b9ea6958f4745cffb0adae312139f1bb2b2ae1f8954d3b6e7efc4de4bef375d1f18f07da577d1901004b46000d00000000c0fa37ded368282f2ef70bf3fffc844a0cedfef6d7b7b77d5fec15bcecb1eff470576d445ce4bef337fe71d0f9b5edd606e0f9defe7c37bf9ec2fcb1ee86a7633dabbe6e00003b11400300000000f06a19eb6e68884fcabae815f0c54995c217117b7fd605454e1a5aecb9d7cc688fb857d26957b7cd56cf5fdffcf89b84932ef5b109434dd5cf2628eb0c00eb0a01340000000000afa2e9875dc3cd352da9e979aebe117b7ff6fee8888bd9db0bdd36ef0ad971561714295a2eb6ff49438be83ce6f085eb7fdb6bf25241978ddb6fbc7f20d4e96cfa798fa6a494813addaa14a10600ac00026800000000005e7533a33dfae2c272bfb088bd3f5f318ba15d366e0ff8e264435ce2f448b7edbdc51dbd68b1ca73e0d653f96e7e1dd9d914770680570101340000000000f8c3e381f6f25b73a5a2cd8b66f8fcf39beec2fce9876a6f29bc57511275e017930b9d5fdbeef7d9f1ac8b5e434dd5ab3e4100c04a2280060000000000a61ef5b7e98b0b735d7cfc3e3beeb2f18f77065e7d73f79de397baf2f366270d26973c6cadcdbc70c3fdedaf8d0b6e78beb73ff98c5b6b7ac6a4a1c5fc1200c0ba47000d0000000000ac1aa8d3a59cbd7aedad3dc6279abdb61cec2ecc7f3aae579af557979b1c7c76d9b83d6cf7b9b68c8c559f020060151140030000000080058cb4d545ed3f6f5cd3f9caa61d451e81d3c35dcfc6f5ed5959c6f53a5c36edf0fffc44675eeeaa0f1b00b0ea08a00100000000c0c2a61f76b5a6a6cf55d8781934bbbeb133f98c5b7568ccd537771b07d3f9d7fc270d2dab3e600080232080060000000000b61a69ab4b3aed6a5c15da58f0ffbe1fa8d351eb1900a020800600000000008b30d6d550e4197465d30ee3e8d979c3b6a8fde7071baa567d7800008742000d000000000016e7d944ef9de3978d33e850a7b30375ba551f1800c0d11040030000000080457b36d15be01e206b71441df8657ab86bd5870400704004d0000000000060291e0fb437c425d645c74fe89b567d300000c744000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d104003000000000000003441000d00000000000000d004013400000000000000401304d000000000000000004d10400300000000fe7f3b764c0200000030a87feba5d82798420080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a0000000080858006000000006021a00100000000580868000000000016021a00000000808580060000000060118a245503fb0487a60000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_filter`
--

CREATE TABLE `sasic_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_filter`
--

INSERT INTO `sasic_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_filter_action`
--

CREATE TABLE `sasic_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_filter_rule`
--

CREATE TABLE `sasic_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_form`
--

CREATE TABLE `sasic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_form`
--

INSERT INTO `sasic_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_form_entry`
--

CREATE TABLE `sasic_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_form_entry`
--

INSERT INTO `sasic_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(2, 3, NULL, 'C', 1, NULL, '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(7, 1, 3, 'U', 1, NULL, '2023-02-01 19:44:31', '2023-02-01 19:44:31'),
(8, 1, 4, 'U', 1, NULL, '2023-02-01 19:46:13', '2023-02-01 19:46:13'),
(9, 1, 5, 'U', 1, NULL, '2023-02-01 19:48:17', '2023-02-01 19:48:17'),
(10, 1, 6, 'U', 1, NULL, '2023-02-01 19:49:27', '2023-02-01 19:49:27'),
(11, 1, 7, 'U', 1, NULL, '2023-02-01 19:50:53', '2023-02-01 19:50:53'),
(12, 1, 8, 'U', 1, NULL, '2023-02-01 19:52:35', '2023-02-01 19:52:35'),
(13, 1, 9, 'U', 1, NULL, '2023-02-01 19:53:32', '2023-02-01 19:53:32'),
(14, 1, 10, 'U', 1, NULL, '2023-02-01 19:55:24', '2023-02-01 19:55:24'),
(15, 1, 11, 'U', 1, NULL, '2023-02-01 19:56:13', '2023-02-01 19:56:13'),
(16, 1, 12, 'U', 1, NULL, '2023-02-01 19:57:42', '2023-02-01 19:57:42'),
(17, 1, 13, 'U', 1, NULL, '2023-02-01 19:58:56', '2023-02-01 19:58:56'),
(18, 1, 14, 'U', 1, NULL, '2023-02-01 20:00:23', '2023-02-01 20:00:23'),
(19, 1, 15, 'U', 1, NULL, '2023-02-01 20:01:20', '2023-02-01 20:01:20'),
(20, 1, 16, 'U', 1, NULL, '2023-02-01 20:02:29', '2023-02-01 20:02:29'),
(21, 1, 17, 'U', 1, NULL, '2023-02-01 20:03:45', '2023-02-01 20:03:45'),
(22, 1, 18, 'U', 1, NULL, '2023-02-01 20:04:39', '2023-02-01 20:04:39'),
(23, 1, 19, 'U', 1, NULL, '2023-02-01 20:05:29', '2023-02-01 20:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_form_entry_values`
--

CREATE TABLE `sasic_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_form_entry_values`
--

INSERT INTO `sasic_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(1, 28, '1120 5th Street\nAlexandria, LA 71301', NULL),
(1, 29, '3182903674', NULL),
(1, 30, 'https://osticket.com', NULL),
(1, 31, 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.', NULL),
(2, 23, 'SASIC', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(8, 3, NULL, NULL),
(8, 4, NULL, NULL),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(10, 3, NULL, NULL),
(10, 4, NULL, NULL),
(11, 3, NULL, NULL),
(11, 4, NULL, NULL),
(12, 3, NULL, NULL),
(12, 4, NULL, NULL),
(13, 3, NULL, NULL),
(13, 4, NULL, NULL),
(14, 3, NULL, NULL),
(14, 4, NULL, NULL),
(15, 3, NULL, NULL),
(15, 4, NULL, NULL),
(16, 3, NULL, NULL),
(16, 4, NULL, NULL),
(17, 3, NULL, NULL),
(17, 4, NULL, NULL),
(18, 3, NULL, NULL),
(18, 4, NULL, NULL),
(19, 3, NULL, NULL),
(19, 4, NULL, NULL),
(20, 3, NULL, NULL),
(20, 4, NULL, NULL),
(21, 3, NULL, NULL),
(21, 4, NULL, NULL),
(22, 3, NULL, NULL),
(22, 4, NULL, NULL),
(23, 3, NULL, NULL),
(23, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_form_field`
--

CREATE TABLE `sasic_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_form_field`
--

INSERT INTO `sasic_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_group`
--

CREATE TABLE `sasic_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_help_topic`
--

CREATE TABLE `sasic_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_help_topic`
--

INSERT INTO `sasic_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(12, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3, 'Problema Con Equipo de Computo', NULL, NULL, '2023-02-01 19:59:16', '2023-02-01 20:00:10'),
(13, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 'Problema de Conexion a Internet', NULL, NULL, '2023-02-01 20:00:23', '2023-02-01 20:00:23'),
(14, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'Ayuda con Impresora/Copiadora', NULL, NULL, '2023-02-01 20:00:46', '2023-02-01 20:00:46'),
(15, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Ayuda Archivos Word, Excel, PDF', NULL, NULL, '2023-02-01 20:01:04', '2023-02-01 20:01:27'),
(16, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Otros', NULL, NULL, '2023-02-01 20:02:14', '2023-02-01 20:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_help_topic_form`
--

CREATE TABLE `sasic_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_help_topic_form`
--

INSERT INTO `sasic_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}'),
(5, 12, 2, 1, '{\"disable\":[]}'),
(6, 13, 2, 1, '{\"disable\":[]}'),
(7, 14, 2, 1, '{\"disable\":[]}'),
(8, 15, 2, 1, '{\"disable\":[]}'),
(9, 16, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_list`
--

CREATE TABLE `sasic_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_list`
--

INSERT INTO `sasic_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_list_items`
--

CREATE TABLE `sasic_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_lock`
--

CREATE TABLE `sasic_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_note`
--

CREATE TABLE `sasic_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_organization`
--

CREATE TABLE `sasic_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_organization`
--

INSERT INTO `sasic_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2023-01-26 20:38:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_organization__cdata`
--

CREATE TABLE `sasic_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_organization__cdata`
--

INSERT INTO `sasic_organization__cdata` (`org_id`, `name`, `address`, `phone`, `website`, `notes`) VALUES
(1, NULL, '1120 5th Street\nAlexandria, LA 71301', '3182903674', 'https://osticket.com', 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_plugin`
--

CREATE TABLE `sasic_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue`
--

CREATE TABLE `sasic_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_queue`
--

INSERT INTO `sasic_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-01-26 12:38:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_column`
--

CREATE TABLE `sasic_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_queue_column`
--

INSERT INTO `sasic_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_columns`
--

CREATE TABLE `sasic_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_queue_columns`
--

INSERT INTO `sasic_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_config`
--

CREATE TABLE `sasic_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_export`
--

CREATE TABLE `sasic_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_sort`
--

CREATE TABLE `sasic_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_queue_sort`
--

INSERT INTO `sasic_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2023-01-26 12:38:28'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2023-01-26 12:38:28'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2023-01-26 12:38:28'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2023-01-26 12:38:28'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2023-01-26 12:38:28'),
(6, NULL, 'Create Date', '[\"-created\"]', '2023-01-26 12:38:28'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_queue_sorts`
--

CREATE TABLE `sasic_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_queue_sorts`
--

INSERT INTO `sasic_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_role`
--

CREATE TABLE `sasic_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_role`
--

INSERT INTO `sasic_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2023-01-26 12:38:28', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_schedule`
--

CREATE TABLE `sasic_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_schedule`
--

INSERT INTO `sasic_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(2, 1, '24/7', NULL, '', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(3, 1, '24/5', NULL, '', '2023-01-26 12:38:28', '2023-01-26 12:38:28'),
(4, 0, 'U.S. Holidays', NULL, '', '2023-01-26 12:38:28', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_schedule_entry`
--

CREATE TABLE `sasic_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_schedule_entry`
--

INSERT INTO `sasic_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2023-01-26 12:38:28'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2023-01-26 12:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_sequence`
--

CREATE TABLE `sasic_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_sequence`
--

INSERT INTO `sasic_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_session`
--

CREATE TABLE `sasic_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sasic_session`
--

INSERT INTO `sasic_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('089153b432c81cd4793d2ed773bbac52', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266613865646636316132643138373039386237646362376534353139666265663563623363393265223b733a343a2274696d65223b693a313637343736353532363b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32303a222f73617369632f7363702f61646d696e2e706870223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a61646d696e5449223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2239343037386139326435623562303733326164366536363439346535626166623a313637343736353532353a6635323837363464363234646231323962333263323166626361306362386436223b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e725645766b54723330554f4c655166526450426141647166736547516b49454a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313637343736353532363b7d7d6c61737463726f6e63616c6c7c693a313637343736353532363b, '2023-01-27 12:38:46', NULL, '0', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0'),
('c80sjhbtvghgovdm70jgjfbl49', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236393762356432303064396139656336633839316238363138363865393462356365646664306365223b733a343a2274696d65223b693a313637353238303435373b7d5f617574687c613a323a7b733a353a227374616666223b4e3b733a343a2275736572223b613a303a7b7d7d3a746f6b656e7c613a303a7b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a333a22555443223b7d636c69656e743a517c4e3b, '2023-02-02 19:40:57', NULL, '0', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36'),
('epmb0insb8mct4u3lakk98nqo1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233373036656630373834323232313462643731623662666630336531626661363832633465633330223b733a343a2274696d65223b693a313637353238333038313b7d, '2023-02-02 20:24:41', NULL, '0', '192.168.0.212', 'Mozilla/5.0 (Linux; Android 13; Redmi Note 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36'),
('jhgmm8886u3q0v0lup99ndaqm3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235353236616462346465326234383363663637373961326539316138366437363961306663333735223b733a343a2274696d65223b693a313637353238323839303b7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a61646d696e5449223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265303634393339386133373865363935626664366262613763333838623833353a313637353238323839303a6337393264623266343436373065303036656366326564346231393864656362223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30312d32362031323a33383a3238223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a333a22555443223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e77564f594f4b35513344744f654536654d624d355a3148464a4e6f4e63344978223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313637353238323835373b7d7d6c61737463726f6e63616c6c7c693a313637353238323835373b, '2023-02-02 20:21:30', NULL, '1', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0'),
('lspushjq407hdvod9orpph8amj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231303564353362633430343331356338316130633831373234653437653938393230353838613732223b733a343a2274696d65223b693a313637353238323031323b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b613a323a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a61646d696e5449223b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2264323738623334316531646264383366313562626365613131653239626634613a313637353238313939353a6337393264623266343436373065303036656366326564346231393864656362223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30312d32362031323a33383a3238223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a333a22555443223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e77564f594f4b35513344744f654536654d624d355a3148464a4e6f4e63344978223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313637353238313933323b7d7d6c61737463726f6e63616c6c7c693a313637353238313933323b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323535393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3338333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3333333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d693a323b433a313a2251223a37333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a323a7b693a303b693a313b693a313b693a333b7d7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a393a222f6f70656e2e706870223b7d7d, '2023-02-02 20:06:52', NULL, '1', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36'),
('o79ug839lsrtvhr0tpe1csgr6m', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235306539633431643264666434326530653431366366653136333864643065366363356434633561223b733a343a2274696d65223b693a313637353238323137393b7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b693a313b733a333a226b6579223b733a31333a226c6f63616c3a61646d696e5449223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236626430333366303365333231383639343735343735363261646365663438303a313637353238323137363a6337393264623266343436373065303036656366326564346231393864656362223b7d3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d30312d32362031323a33383a3238223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a333a22555443223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e77564f594f4b35513344744f654536654d624d355a3148464a4e6f4e63344978223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313637353238323134373b7d7d6c61737463726f6e63616c6c7c693a313637353238323134383b3a513a75736572737c433a383a225175657279536574223a3737313a7b613a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c433a383a225175657279536574223a323535393a7b613a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b433a313a2251223a3130363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a35373a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d7d7d693a313b433a313a2251223a3338333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b433a313a2251223a3333333a7b613a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b433a313a2251223a37363a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d7d693a313b433a313a2251223a3130303a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d7d693a323b433a313a2251223a37333a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a323a7b693a303b693a313b693a313b693a333b7d7d7d7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b433a313a2251223a37343a7b613a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a226c6576656c223b693a303b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a22616c696173223b4e3b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a353a22616c696173223b4e3b733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d7d, '2023-02-02 20:09:39', NULL, '0', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'),
('pga294htramr0rt69ccho8c65j', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230636665323035366166633066333832343938343763666335316331646634663030653264616661223b733a343a2274696d65223b693a313637353238323931393b7d5f636c69656e747c613a313a7b733a343a2261757468223b613a313a7b733a343a2264657374223b733a393a222f6f70656e2e706870223b7d7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32343a22417574656e746963616369c3b36e20526571756572696461223b7d7d, '2023-02-02 20:21:59', NULL, '0', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36'),
('phusd46irg653rr1j6kr0gfr3m', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237336665366661373064396462366537613936623464333361663134343230353736613837313339223b733a343a2274696d65223b693a313637353238333032333b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2023-02-02 20:23:43', NULL, '0', '192.168.0.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_sla`
--

CREATE TABLE `sasic_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_sla`
--

INSERT INTO `sasic_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_staff`
--

CREATE TABLE `sasic_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_staff`
--

INSERT INTO `sasic_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'adminTI', 'TI', 'SECOEM', '$2a$08$ZcxHRBLspoOcd6kpfSeJgOVsDsilhNfTf57FLzqr2E/7epYts0GYO', NULL, 'alanosmarviraspam@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"es_MX\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"emails.banlist\":1}', '2023-01-26 12:38:29', '2023-02-01 20:23:38', '2023-01-26 12:38:29', '2023-02-01 20:23:38'),
(2, 1, 1, 'carlos', 'carlos', 'rodriguez', '$2a$08$Z8RMCSlTnjIAapulo2cKfOYgWxKnrcMoL9.baNPSk6uGSP1oQsTbq', NULL, 'carlosroyiga@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'none', 'Letter', '{\"browser_lang\":\"es_MX\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1}', '2023-02-01 19:39:53', '2023-02-01 20:19:13', '2023-02-01 19:41:52', '2023-02-01 20:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_staff_dept_access`
--

CREATE TABLE `sasic_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_staff_dept_access`
--

INSERT INTO `sasic_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_syslog`
--

CREATE TABLE `sasic_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_syslog`
--

INSERT INTO `sasic_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '127.0.0.1', '2023-01-26 12:38:29', '2023-01-26 12:38:29'),
(2, 'Error', 'Error de Mailer', 'Incapaz de enviar email con la función mail de php:\"prueba123\" mail() returned failure ', '', '192.168.0.212', '2023-02-01 19:38:56', '2023-02-01 19:38:56'),
(3, 'Error', 'Error de Mailer', 'Incapaz de enviar email con la función mail de php:carlosroyiga@gmail.com mail() returned failure ', '', '192.168.0.212', '2023-02-01 19:39:53', '2023-02-01 19:39:53'),
(4, 'Error', 'Error de Mailer', 'Incapaz de enviar email con la función mail de php:alanosmarviraspam@gmail.com mail() returned failure ', '', '192.168.0.212', '2023-02-01 19:40:17', '2023-02-01 19:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_task`
--

CREATE TABLE `sasic_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_task__cdata`
--

CREATE TABLE `sasic_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_team`
--

CREATE TABLE `sasic_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_team`
--

INSERT INTO `sasic_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2023-01-26 12:38:27', '2023-01-26 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_team_member`
--

CREATE TABLE `sasic_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread`
--

CREATE TABLE `sasic_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_collaborator`
--

CREATE TABLE `sasic_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_entry`
--

CREATE TABLE `sasic_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_entry_email`
--

CREATE TABLE `sasic_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_entry_merge`
--

CREATE TABLE `sasic_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_event`
--

CREATE TABLE `sasic_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_thread_event`
--

INSERT INTO `sasic_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 0, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2023-01-26 12:38:29'),
(2, 0, 'T', 8, 0, 0, 1, 1, NULL, 'SYSTEM', NULL, 'S', 0, '2023-02-01 19:37:16'),
(3, 0, 'T', 1, 0, 0, 1, 2, NULL, 'prueba123', 2, 'U', 0, '2023-02-01 19:40:16'),
(4, 2, 'T', 14, 1, 0, 1, 2, NULL, 'adminTI', 1, 'S', 0, '2023-02-01 19:43:27'),
(5, 1, 'T', 14, 1, 0, 1, 1, NULL, 'adminTI', 1, 'S', 0, '2023-02-01 19:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_thread_referral`
--

CREATE TABLE `sasic_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_ticket`
--

CREATE TABLE `sasic_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_ticket_priority`
--

CREATE TABLE `sasic_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_ticket_priority`
--

INSERT INTO `sasic_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sasic_ticket_status`
--

CREATE TABLE `sasic_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_ticket_status`
--

INSERT INTO `sasic_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2023-01-26 12:38:28', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2023-01-26 12:38:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_ticket__cdata`
--

CREATE TABLE `sasic_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_translation`
--

CREATE TABLE `sasic_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sasic_user`
--

CREATE TABLE `sasic_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_user`
--

INSERT INTO `sasic_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(3, 0, 3, 0, 'secretario titular', '2023-02-01 19:44:31', '2023-02-01 19:44:52'),
(4, 0, 4, 0, 'secretaría técnica', '2023-02-01 19:46:13', '2023-02-01 19:46:13'),
(5, 0, 5, 0, 'secretaría particular', '2023-02-01 19:48:17', '2023-02-01 19:48:17'),
(6, 0, 6, 0, 'enlace jurídico', '2023-02-01 19:49:27', '2023-02-01 19:49:27'),
(7, 0, 7, 0, 'unidad de mejora de la gestión', '2023-02-01 19:50:53', '2023-02-01 19:50:53'),
(8, 0, 8, 0, 'dirección de desarrollo organizacional', '2023-02-01 19:52:35', '2023-02-01 19:52:35'),
(9, 0, 9, 0, 'subdirección de organización', '2023-02-01 19:53:32', '2023-02-01 19:53:32'),
(10, 0, 10, 0, 'dirección de transparencia y acceso a la información pública', '2023-02-01 19:55:24', '2023-02-01 19:55:24'),
(11, 0, 11, 0, 'dirección de ciudadanización y contraloría social', '2023-02-01 19:56:13', '2023-02-01 19:56:13'),
(12, 0, 12, 0, 'dirección de auditoria gubernamental', '2023-02-01 19:57:42', '2023-02-01 19:57:42'),
(13, 0, 13, 0, 'subdirección de auditoria gubernamental', '2023-02-01 19:58:56', '2023-02-01 19:58:56'),
(14, 0, 14, 0, 'dirección de normatividad y evaluación de la gestión pública', '2023-02-01 20:00:23', '2023-02-01 20:00:23'),
(15, 0, 15, 0, 'subdurección de seguimiento a sanciones y registro patrimonial', '2023-02-01 20:01:20', '2023-02-01 20:01:20'),
(16, 0, 16, 0, 'subdirección de capacitación y formación', '2023-02-01 20:02:29', '2023-02-01 20:02:29'),
(17, 0, 17, 0, 'unidad de apoyo a órganos internos de control', '2023-02-01 20:03:45', '2023-02-01 20:03:45'),
(18, 0, 18, 0, 'dirección de informática', '2023-02-01 20:04:38', '2023-02-01 20:04:38'),
(19, 0, 19, 0, 'delegación administrativa', '2023-02-01 20:05:29', '2023-02-01 20:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_user_account`
--

CREATE TABLE `sasic_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_user_account`
--

INSERT INTO `sasic_user_account` (`id`, `user_id`, `status`, `timezone`, `lang`, `username`, `passwd`, `backend`, `extra`, `registered`) VALUES
(2, 3, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$rt/WlrY6pOpKea0ITpkf/OkuH8xolQre92zjw0MBAma6u9ejSFIQy', NULL, NULL, '2023-02-01 19:45:42'),
(3, 4, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$IuVrm/LYqMMJ285qnPZ8a.c.pXndZGlzU3yvNh/2hcgRIuIuG7RhW', NULL, NULL, '2023-02-01 19:46:32'),
(4, 5, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$4ZIviCUWpJ4VrrmAwDqiMuICxqRPU.XW6YwvmXJED0mUKm4J0h6we', 'client', NULL, '2023-02-01 19:48:44'),
(5, 6, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$HOAlwfUW2usgvzfH9329fe3FI93a0UD7FPZW0fy0uqJCw466oOD5e', 'client', NULL, '2023-02-01 19:50:09'),
(6, 7, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$goGohKjJqqbuWA70l8orN.1r9q32WXF8ADQvTPb1yrbnH2u.acaEy', 'client', NULL, '2023-02-01 19:51:24'),
(7, 8, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$YuFp2Avf9GGt1vqfCWXHE.GSUKqiFxw2kAOh9OkWl5JzSTwB/xGlm', NULL, NULL, '2023-02-01 19:52:58'),
(8, 9, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$.XuS3TqfziuujMRNHVXQQ.4jMkGsNC0nirP82oJ9pNXS5be0eEk/a', NULL, NULL, '2023-02-01 19:53:59'),
(9, 10, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$KXBW2w4qCopxHAfjcvyWI.wZh3xUFa/VFf6gR6wxF5vQzMrqsLpBu', 'client', NULL, '2023-02-01 19:55:48'),
(10, 11, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$dzMk.VHIaCsvxpCs8xCmIehiQStEiqcHpg1Mjw.91y/RBPT1Nt8FC', 'client', NULL, '2023-02-01 19:57:08'),
(11, 12, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$yEcTeGSRrFuPQgKuSMUux.MXYLH/.JHdbvsh83ceSpPRR5iHTxEje', 'client', NULL, '2023-02-01 19:58:09'),
(12, 13, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$tNcEayBgn5USOnITD7NJS.XTP42MHGl/U5jtx3sOqQJz2UDKU81Ya', 'client', NULL, '2023-02-01 19:59:30'),
(13, 14, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$YquHQwWkBMwvjsIej83fTek906OvmIyAP3CmExUkyCJw2CNXdM7cq', 'client', NULL, '2023-02-01 20:00:51'),
(14, 15, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$Qnxkv2bpLHRu7g3AGgoIQOLu0vpkdDcU/vQJk2mlwXZiUth7ZD5c.', 'client', NULL, '2023-02-01 20:01:50'),
(15, 16, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$9nfszQqvLwWK.2f2QNgvSuYpChiQsB/GDxllQdz49k7IT9HCYlDqu', NULL, NULL, '2023-02-01 20:03:07'),
(16, 17, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$fGyaubL.qJYZ8JmjDO7tnez1.Rft5J9JwFwOAyafOliZqanC3sGHq', 'client', NULL, '2023-02-01 20:04:11'),
(17, 18, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$E9v5FLK9Ey3AEnlPNCfqoOusflqIzg.42eK.h8a/YhjQHSk2kjkW6', 'client', NULL, '2023-02-01 20:05:04'),
(18, 19, 1, 'America/Mexico_City', NULL, NULL, '$2a$08$2AXF6J3DqQTNQJvtpTlXkO8iFXU1bs0c0URB14ACdKFufko1gttKW', 'client', NULL, '2023-02-01 20:05:56');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_user_email`
--

CREATE TABLE `sasic_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_user_email`
--

INSERT INTO `sasic_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(3, 3, 0, 'sec.titular@sasic.com'),
(4, 4, 0, 'sec.tecnica@sasic.com'),
(5, 5, 0, 'sec.particular@sasic.com'),
(6, 6, 0, 'enlace.juridico@sasic.com'),
(7, 7, 0, 'unid.mejora.gestion@sasic.com'),
(8, 8, 0, 'dir.desarrollo.organ@sasic.com'),
(9, 9, 0, 'sub.organizacional@sasic.com'),
(10, 10, 0, 'dir.transp@sasic.com'),
(11, 11, 0, 'dir.cont.soc@sasic.com'),
(12, 12, 0, 'dir.audit.gub@sasic.com'),
(13, 13, 0, 'sub.audit.gub@sasic.com'),
(14, 14, 0, 'dir.normatividad.ev@sasic.com'),
(15, 15, 0, 'sub.seg.san@sasic.com'),
(16, 16, 0, 'sub.cap.form@sasic.com'),
(17, 17, 0, 'unid.apoyo.oic@sasic.com'),
(18, 18, 0, 'dir.inform@sasic.com'),
(19, 19, 0, 'deleg.adm@sasic.com');

-- --------------------------------------------------------

--
-- Table structure for table `sasic_user__cdata`
--

CREATE TABLE `sasic_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic_user__cdata`
--

INSERT INTO `sasic_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, NULL, NULL, '', ''),
(3, NULL, NULL, '', ''),
(4, NULL, NULL, '', ''),
(5, NULL, NULL, '', ''),
(6, NULL, NULL, '', ''),
(7, NULL, NULL, '', ''),
(8, NULL, NULL, '', ''),
(9, NULL, NULL, '', ''),
(10, NULL, NULL, '', ''),
(11, NULL, NULL, '', ''),
(12, NULL, NULL, '', ''),
(13, NULL, NULL, '', ''),
(14, NULL, NULL, '', ''),
(15, NULL, NULL, '', ''),
(16, NULL, NULL, '', ''),
(17, NULL, NULL, '', ''),
(18, NULL, NULL, '', ''),
(19, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sasic__search`
--

CREATE TABLE `sasic__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sasic__search`
--

INSERT INTO `sasic__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('O', 1, 'osTicket', '1120 5th Street Alexandria, LA 71301\n(318) 290-3674\nhttps://osticket.com\nNot only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.'),
('U', 3, 'secretario titular', ' sec.titular@sasic.com'),
('U', 4, 'secretaría técnica', ' sec.tecnica@sasic.com\nsec.tecnica@sasic.com'),
('U', 5, 'secretaría particular', ' sec.particular@sasic.com\nsec.particular@sasic.com'),
('U', 6, 'enlace jurídico', ' enlace.juridico@sasic.com\nenlace.juridico@sasic.com'),
('U', 7, 'unidad de mejora de la gestión', ' unid.mejora.gestion@sasic.com\nunid.mejora.gestion@sasic.com'),
('U', 8, 'dirección de desarrollo organizacional', ' dir.desarrollo.organ@sasic.com\ndir.desarrollo.organ@sasic.com'),
('U', 9, 'subdirección de organización', ' sub.organizacional@sasic.com\nsub.organizacional@sasic.com'),
('U', 10, 'dirección de transparencia y acceso a la información pública', ' dir.transp@sasic.com\ndir.transp@sasic.com'),
('U', 11, 'dirección de ciudadanización y contraloría social', ' dir.cont.soc@sasic.com\ndir.cont.soc@sasic.com'),
('U', 12, 'dirección de auditoria gubernamental', ' dir.audit.gub@sasic.com\ndir.audit.gub@sasic.com'),
('U', 13, 'subdirección de auditoria gubernamental', ' sub.audit.gub@sasic.com\nsub.audit.gub@sasic.com'),
('U', 14, 'dirección de normatividad y evaluación de la gestión pública', ' dir.normatividad.ev@sasic.com\ndir.normatividad.ev@sasic.com'),
('U', 15, 'subdurección de seguimiento a sanciones y registro patrimonial', ' sub.seg.san@sasic.com\nsub.seg.san@sasic.com'),
('U', 16, 'subdirección de capacitación y formación', ' sub.cap.form@sasic.com\nsub.cap.form@sasic.com'),
('U', 17, 'unidad de apoyo a órganos internos de control', ' unid.apoyo.oic@sasic.com\nunid.apoyo.oic@sasic.com'),
('U', 18, 'dirección de informática', ' dir.inform@sasic.com\ndir.inform@sasic.com'),
('U', 19, 'delegación administrativa', ' deleg.adm@sasic.com\ndeleg.adm@sasic.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sasic_api_key`
--
ALTER TABLE `sasic_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indexes for table `sasic_attachment`
--
ALTER TABLE `sasic_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indexes for table `sasic_canned_response`
--
ALTER TABLE `sasic_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indexes for table `sasic_config`
--
ALTER TABLE `sasic_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indexes for table `sasic_content`
--
ALTER TABLE `sasic_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sasic_department`
--
ALTER TABLE `sasic_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`);

--
-- Indexes for table `sasic_draft`
--
ALTER TABLE `sasic_draft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_email`
--
ALTER TABLE `sasic_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `sasic_email_account`
--
ALTER TABLE `sasic_email_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_email_template`
--
ALTER TABLE `sasic_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indexes for table `sasic_email_template_group`
--
ALTER TABLE `sasic_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `sasic_event`
--
ALTER TABLE `sasic_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sasic_faq`
--
ALTER TABLE `sasic_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indexes for table `sasic_faq_category`
--
ALTER TABLE `sasic_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `sasic_faq_topic`
--
ALTER TABLE `sasic_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indexes for table `sasic_file`
--
ALTER TABLE `sasic_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`);

--
-- Indexes for table `sasic_file_chunk`
--
ALTER TABLE `sasic_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indexes for table `sasic_filter`
--
ALTER TABLE `sasic_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `sasic_filter_action`
--
ALTER TABLE `sasic_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `sasic_filter_rule`
--
ALTER TABLE `sasic_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `sasic_form`
--
ALTER TABLE `sasic_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_form_entry`
--
ALTER TABLE `sasic_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indexes for table `sasic_form_entry_values`
--
ALTER TABLE `sasic_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexes for table `sasic_form_field`
--
ALTER TABLE `sasic_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_group`
--
ALTER TABLE `sasic_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `sasic_help_topic`
--
ALTER TABLE `sasic_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `sasic_help_topic_form`
--
ALTER TABLE `sasic_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indexes for table `sasic_list`
--
ALTER TABLE `sasic_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `sasic_list_items`
--
ALTER TABLE `sasic_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indexes for table `sasic_lock`
--
ALTER TABLE `sasic_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `sasic_note`
--
ALTER TABLE `sasic_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indexes for table `sasic_organization`
--
ALTER TABLE `sasic_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_organization__cdata`
--
ALTER TABLE `sasic_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `sasic_plugin`
--
ALTER TABLE `sasic_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_queue`
--
ALTER TABLE `sasic_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_queue_column`
--
ALTER TABLE `sasic_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_queue_columns`
--
ALTER TABLE `sasic_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indexes for table `sasic_queue_config`
--
ALTER TABLE `sasic_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indexes for table `sasic_queue_export`
--
ALTER TABLE `sasic_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indexes for table `sasic_queue_sort`
--
ALTER TABLE `sasic_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_queue_sorts`
--
ALTER TABLE `sasic_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indexes for table `sasic_role`
--
ALTER TABLE `sasic_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sasic_schedule`
--
ALTER TABLE `sasic_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_schedule_entry`
--
ALTER TABLE `sasic_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indexes for table `sasic_sequence`
--
ALTER TABLE `sasic_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasic_session`
--
ALTER TABLE `sasic_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sasic_sla`
--
ALTER TABLE `sasic_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sasic_staff`
--
ALTER TABLE `sasic_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`);

--
-- Indexes for table `sasic_staff_dept_access`
--
ALTER TABLE `sasic_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `sasic_syslog`
--
ALTER TABLE `sasic_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indexes for table `sasic_task`
--
ALTER TABLE `sasic_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`);

--
-- Indexes for table `sasic_task__cdata`
--
ALTER TABLE `sasic_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `sasic_team`
--
ALTER TABLE `sasic_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `sasic_team_member`
--
ALTER TABLE `sasic_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`);

--
-- Indexes for table `sasic_thread`
--
ALTER TABLE `sasic_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indexes for table `sasic_thread_collaborator`
--
ALTER TABLE `sasic_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sasic_thread_entry`
--
ALTER TABLE `sasic_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `sasic_thread_entry_email`
--
ALTER TABLE `sasic_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `sasic_thread_entry_merge`
--
ALTER TABLE `sasic_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indexes for table `sasic_thread_event`
--
ALTER TABLE `sasic_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indexes for table `sasic_thread_referral`
--
ALTER TABLE `sasic_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `sasic_ticket`
--
ALTER TABLE `sasic_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`);

--
-- Indexes for table `sasic_ticket_priority`
--
ALTER TABLE `sasic_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `sasic_ticket_status`
--
ALTER TABLE `sasic_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `sasic_ticket__cdata`
--
ALTER TABLE `sasic_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `sasic_translation`
--
ALTER TABLE `sasic_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indexes for table `sasic_user`
--
ALTER TABLE `sasic_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indexes for table `sasic_user_account`
--
ALTER TABLE `sasic_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sasic_user_email`
--
ALTER TABLE `sasic_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indexes for table `sasic_user__cdata`
--
ALTER TABLE `sasic_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `sasic__search`
--
ALTER TABLE `sasic__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `sasic__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sasic_api_key`
--
ALTER TABLE `sasic_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_attachment`
--
ALTER TABLE `sasic_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sasic_canned_response`
--
ALTER TABLE `sasic_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_config`
--
ALTER TABLE `sasic_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `sasic_content`
--
ALTER TABLE `sasic_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sasic_department`
--
ALTER TABLE `sasic_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sasic_draft`
--
ALTER TABLE `sasic_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sasic_email`
--
ALTER TABLE `sasic_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sasic_email_account`
--
ALTER TABLE `sasic_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_email_template`
--
ALTER TABLE `sasic_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sasic_email_template_group`
--
ALTER TABLE `sasic_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_event`
--
ALTER TABLE `sasic_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sasic_faq`
--
ALTER TABLE `sasic_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_faq_category`
--
ALTER TABLE `sasic_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_file`
--
ALTER TABLE `sasic_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sasic_filter`
--
ALTER TABLE `sasic_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_filter_action`
--
ALTER TABLE `sasic_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_filter_rule`
--
ALTER TABLE `sasic_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_form`
--
ALTER TABLE `sasic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sasic_form_entry`
--
ALTER TABLE `sasic_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sasic_form_field`
--
ALTER TABLE `sasic_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `sasic_group`
--
ALTER TABLE `sasic_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_help_topic`
--
ALTER TABLE `sasic_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sasic_help_topic_form`
--
ALTER TABLE `sasic_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sasic_list`
--
ALTER TABLE `sasic_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_list_items`
--
ALTER TABLE `sasic_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_lock`
--
ALTER TABLE `sasic_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_note`
--
ALTER TABLE `sasic_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_organization`
--
ALTER TABLE `sasic_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_plugin`
--
ALTER TABLE `sasic_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_queue`
--
ALTER TABLE `sasic_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sasic_queue_column`
--
ALTER TABLE `sasic_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sasic_queue_export`
--
ALTER TABLE `sasic_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_queue_sort`
--
ALTER TABLE `sasic_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sasic_role`
--
ALTER TABLE `sasic_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sasic_schedule`
--
ALTER TABLE `sasic_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sasic_schedule_entry`
--
ALTER TABLE `sasic_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sasic_sequence`
--
ALTER TABLE `sasic_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_sla`
--
ALTER TABLE `sasic_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_staff`
--
ALTER TABLE `sasic_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_syslog`
--
ALTER TABLE `sasic_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sasic_task`
--
ALTER TABLE `sasic_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_team`
--
ALTER TABLE `sasic_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sasic_thread`
--
ALTER TABLE `sasic_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_thread_collaborator`
--
ALTER TABLE `sasic_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_thread_entry`
--
ALTER TABLE `sasic_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_thread_entry_email`
--
ALTER TABLE `sasic_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_thread_entry_merge`
--
ALTER TABLE `sasic_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_thread_event`
--
ALTER TABLE `sasic_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sasic_thread_referral`
--
ALTER TABLE `sasic_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_ticket`
--
ALTER TABLE `sasic_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sasic_ticket_priority`
--
ALTER TABLE `sasic_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sasic_ticket_status`
--
ALTER TABLE `sasic_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sasic_translation`
--
ALTER TABLE `sasic_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sasic_user`
--
ALTER TABLE `sasic_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sasic_user_account`
--
ALTER TABLE `sasic_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sasic_user_email`
--
ALTER TABLE `sasic_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
