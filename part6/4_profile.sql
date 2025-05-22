BEGIN
    --dbms_cloud_ai.drop_profile('AI_PROFILE_OPENAI_EATS');
    DBMS_CLOUD_AI.create_profile('AI_PROFILE_OPENAI_EATS', '{
        "provider": "openai",
        "model": "gpt-4.1-mini-2025-04-14",
        "credential_name": "CREDENTIAL_OPENAI",
        "object_list": [{"owner": "may13", "name": "RESTAURANTS"},
                        {"owner": "may13", "name": "DELIVERY_OPTIONS"},
                        {"owner": "may13", "name": "RESTAURANT_SCHEDULES"},
                        {"owner": "may13", "name": "MENU_ITEMS"},
                        {"owner": "may13", "name": "PROMOTIONS"},
                        {"owner": "may13", "name": "ITEM_OPTIONS"}],
        "conversation": "true"
       }');
END;