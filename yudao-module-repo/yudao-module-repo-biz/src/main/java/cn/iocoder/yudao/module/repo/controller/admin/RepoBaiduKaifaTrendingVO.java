package cn.iocoder.yudao.module.repo.controller.admin;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@Data
public class RepoBaiduKaifaTrendingVO {

    /**
     * status
     */
    private String status;
    /**
     * message
     */
    private String message;
    /**
     * data
     */
    private DataDTO data;

    /**
     * DataDTO
     */
    @NoArgsConstructor
    @Data
    public static class DataDTO {
        /**
         * trendingList
         */
        private List<TrendingListDTO> trendingList;
        /**
         * config
         */
        private ConfigDTO config;

        /**
         * ConfigDTO
         */
        @NoArgsConstructor
        @Data
        public static class ConfigDTO {
            /**
             * optionLanguage
             */
            private String optionLanguage;
            /**
             * optionSince
             */
            private String optionSince;
        }

        /**
         * TrendingListDTO
         */
        @NoArgsConstructor
        @Data
        public static class TrendingListDTO {
            /**
             * id
             */
            private Integer id;
            /**
             * url
             */
            private String url;
            /**
             * title
             */
            private String title;
            /**
             * summary
             */
            private String summary;
            /**
             * language
             */
            private String language;
            /**
             * star
             */
            private Integer star;
            /**
             * fork
             */
            private Integer fork;
            /**
             * rank
             */
            private Integer rank;
        }
    }
}
