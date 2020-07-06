/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 15:49:25 by kefujiwa          #+#    #+#             */
/*   Updated: 2020/07/06 23:38:12 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*substr;
	char	*p_substr;

	if (!s)
		return (NULL);
	substr = (char*)ft_calloc(len + 1, sizeof(char));
	if (!substr)
		return (NULL);
	p_substr = substr;
	while (len && s[start] && start < ft_strlen(s))
	{
		*p_substr = s[start];
		p_substr++;
		start++;
		len--;
	}
	*p_substr = '\0';
	return (substr);
}
