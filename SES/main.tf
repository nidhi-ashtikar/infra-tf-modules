

resource "aws_ses_configuration_set" "config_set" {

  name = var.configuration_set_name #"config_set"
  reputation_metrics_enabled = var.reputation_metrics_enabled # Amazon CloudWatch metric. The default value is false
  sending_enabled = var.sending_enabled # email sending is enabled or disabled for the configuration set. The default value is true.
  
  delivery_options {
    tls_policy = "Require"  #If the value is Optional, messages can be delivered in plain text if a TLS connection can't be established. 
  }

  tracking_options {
    custom_redirect_domain = var.custom_redirect_domain #   "sub.example.com"
  }

}

resource "aws_ses_domain_identity" "domain_identity" {
  domain = var.domain_name
}


resource "aws_ses_domain_dkim" "dkim_identity" {
  domain = aws_ses_domain_identity.domain_identity.domain
}

resource "aws_route53_record" "amazonses_dkim_record" {
  count = var.dkim_record_count
  zone_id = var.dkim_record_zone_id
  name = "${aws_ses_domain_dkim.dkim_identity.dkim_tokens[count.index]}._domainkey"
  type = var.dkim_record_type
  ttl = var.dkim_record_ttl
  records = ["${aws_ses_domain_dkim.dkim_identity.dkim_tokens[count.index]}.dkim.amazonses.com"]
}


resource "aws_ses_domain_identity_verification" "domain_identity_verification" {
  domain = aws_ses_domain_identity.domain_identity.id

  depends_on = [aws_route53_record.amazonses_dkim_record]
}

    

