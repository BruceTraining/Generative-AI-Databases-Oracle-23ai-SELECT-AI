BEGIN
    --dbms_cloud_ai.drop_profile('AI_PROFILE_OPENAI_EATS');
    DBMS_CLOUD_AI.create_profile('AI_PROFILE_OPENAI_EATS', '{
        "provider": "openai",
        "model": "gpt-4.1-mini-2025-04-14",
        "credential_name": "CREDENTIAL_OPENAI",
        "object_list": [{"owner": "user_oreilly_may27", "name": "RESTAURANTS"},
                        {"owner": "user_oreilly_may27", "name": "DELIVERY_OPTIONS"},
                        {"owner": "user_oreilly_may27", "name": "RESTAURANT_SCHEDULES"},
                        {"owner": "user_oreilly_may27", "name": "MENU_ITEMS"},
                        {"owner": "user_oreilly_may27", "name": "PROMOTIONS"},
                        {"owner": "user_oreilly_may27", "name": "ITEM_OPTIONS"}],
        "conversation": "true"
       }');
END;